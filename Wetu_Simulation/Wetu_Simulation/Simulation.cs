using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wetu_Simulation
{
    class Simulation
    {
        private PostRepository post = new PostRepository();

        private string PostUrl { get; set; }

        private List<Company> WetuSystem { get; set; }
        private List<int> PublicRegistrar { get; set; }
        private List<Species> SpeciesList { get; set; }

        private Random rand { get; set; }
        private int SelectedCompany { get; set; }
        private int SelectedUser { get; set; }

        public Simulation() { }
        public Simulation(string _PostUrl)
        {
            this.rand = new Random();
            this.PostUrl = "http://" + _PostUrl;
            this.WetuSystem = new List<Company>();
            this.SetSpecies();
            this.SetPublicRegistrar();
            this.SetCompanies();
        }

        private void SetCompanies()
        {
            int[] companies = GetCompanies();

            Company ins;
            for(int i=0; i<companies.Length; i++)
            {
                ins = new Company(companies[i], this.PostUrl);
                this.WetuSystem.Add(ins);
            }
        }

        private int [] GetCompanies()
        {
            var values = new NameValueCollection();
            values["Auth"] = "Wetu_Service";

            List<int> companies = post.GetDataList<int>(this.PostUrl + URLs.GetCompanies, values);

            return companies.ToArray();
        }

        private void SetPublicRegistrar()
        {
            var values = new NameValueCollection();
            values["Auth"] = "Wetu_Service";

            this.PublicRegistrar = post.GetDataList<int>(this.PostUrl + URLs.GetPublicRegistrar, values);
        }

        private void SetSpecies()
        {
            var values = new NameValueCollection();
            values["Auth"] = "Wetu_Service";

            this.SpeciesList = post.GetDataList<Species>(this.PostUrl + URLs.GetSpecies, values);
        }

        private void SelectRandomCompany()
        {
            this.SelectedCompany = this.WetuSystem[this.rand.Next(0, this.WetuSystem.Count)].CompanyId;
        }

        private void SelectRandomUser()
        {
            this.SelectedUser = this.WetuSystem[this.SelectedCompany].Users[this.rand.Next(0, this.WetuSystem[this.SelectedCompany].Users.Count)];
        }

        private int SelectRandomSpecies()
        {
            return this.SpeciesList[this.rand.Next(0, this.SpeciesList.Count)].SpeciesId;
        }

        private int BuildSpecies()
        {
            ///TODO
            return 0;
        }

        private string GenerateRandomString(int Length)
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
            var random = new Random();
            var result = new string(
                Enumerable.Repeat(chars, Length)
                          .Select(s => s[random.Next(s.Length)])
                          .ToArray());

            return result;
        }

        public void AddCompany()
        {
            string Name = GenerateRandomString(8);
            var values = new NameValueCollection();
            values["CompanyName"] = Name;

            int result = post.GetDataInstance<int>(this.PostUrl + URLs.AddCompany, values);

            if(result != 0)
            {
                Company ins = new Company(result, this.PostUrl);
                this.WetuSystem.Add(ins);
                Console.WriteLine("Company Added: " + result.ToString());
            }
            else
            {
                Console.WriteLine("Failed to insert Company");
            }
        }

        public void AddUser()
        {
            this.SelectRandomCompany();
            string Name = GenerateRandomString(8);

            var values = new NameValueCollection();
            values["Username"] = Name;
            values["Password"] = "12345@qwerty";
            values["CompanyId"] = this.SelectedCompany.ToString();

            int result = post.GetDataInstance<int>(this.PostUrl + URLs.AddUser, values);

            if (result != 0)
            {
                this.WetuSystem[this.SelectedCompany].Users.Add(result);
                Console.WriteLine("Company " + this.SelectedCompany.ToString() + " Added User: " + Name);
            }
            else
            {
                Console.WriteLine("Failed to insert User");
            }

        }

        private Animal AddDevice()
        {
            this.SelectRandomCompany();
            this.SelectRandomUser();

            var values = new NameValueCollection();
            values["Address"] = GenerateRandomString(8);
            values["CompanyId"] = this.SelectedCompany.ToString();
            values["UserKey"] = this.SelectedUser.ToString();            

            int result = post.GetDataInstance<int>(this.PostUrl + URLs.AddDevice, values);

            Animal ins = new Animal();
            ins.AnimalId = result;
            ins.DeviceAddress = values["Address"];
            return ins;
        }

        public void AddAnimal()
        {
            Animal ins = new Animal();
            ins = this.AddDevice();

            if(ins.AnimalId != 0)
            {
                Console.WriteLine("Company " + this.SelectedCompany.ToString() + " Added Device: " + ins.DeviceAddress);

                int SexId = this.rand.Next(1, 3);
                var values = new NameValueCollection();
                string Name = GenerateRandomString(8);
                values["Name"] = Name;
                values["Tag"] = GenerateRandomString(8);
                values["DeviceId"] = ins.AnimalId.ToString();
                values["SexId"] = SexId.ToString();
                values["Species"] = this.SelectRandomSpecies().ToString();
                values["CompanyId"] = this.SelectedCompany.ToString();
                values["UserKey"] = this.SelectedUser.ToString();                

                int result = post.GetDataInstance<int>(this.PostUrl + URLs.AddAnimal, values);

                if (result != 0)
                {                    
                    ins.AnimalId = result;
                    this.WetuSystem[this.SelectedCompany].Animals.Add(ins);
                    Console.WriteLine("Company " + this.SelectedCompany.ToString() + " Added Animal: " + Name + " with Device - " + ins.DeviceAddress);

                    if(SexId == 1)
                    {
                        this.WetuSystem[this.SelectedCompany].MaleAnimals.Add(ins);
                    }
                    else
                    {
                        this.WetuSystem[this.SelectedCompany].FemaleAnimals.Add(ins);
                    }

                }
                else
                {
                    Console.WriteLine("Failed to insert Animal");
                }
            }
            else
            {
                Console.WriteLine("Failed to insert Device");
            }

            
        }
    }
}
