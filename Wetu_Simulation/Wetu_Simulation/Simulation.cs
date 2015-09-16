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
        private int SelectedCompanyIndex { get; set; }
        private int SelectedCompany { get; set; }
        
        private int SelectedUser { get; set; }
        private int SelectedTube { get; set; }

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
            this.SelectedCompanyIndex = this.rand.Next(0, this.WetuSystem.Count);
            this.SelectedCompany = this.WetuSystem[this.SelectedCompanyIndex].CompanyId;
        }

        private void SelectRandomUser()
        {
            if (this.WetuSystem[this.SelectedCompanyIndex].Users.Count == 0)
            {
                this.SelectedUser = 0;
            }
            else
            {
                this.SelectedUser = this.WetuSystem[this.SelectedCompanyIndex].Users[this.rand.Next(0, this.WetuSystem[this.SelectedCompanyIndex].Users.Count)];
            }
            
        }

        private int SelectRandomSpecies()
        {
            return this.SpeciesList[this.rand.Next(0, this.SpeciesList.Count)].SpeciesId;
        }

        private int SelectRandomMaleAnimal()
        {
            if (this.WetuSystem[this.SelectedCompanyIndex].MaleAnimals.Count == 0)
            {
                return 0;
            }
            else
            {
                return this.WetuSystem[this.SelectedCompanyIndex].MaleAnimals[this.rand.Next(0, this.WetuSystem[this.SelectedCompanyIndex].MaleAnimals.Count)].AnimalId;
            }
            
        }

        private int SelectRandomFemaleAnimal()
        {
            if (this.WetuSystem[this.SelectedCompanyIndex].FemaleAnimals.Count == 0)
            {
                return 0;
            }
            else
            {
                return this.WetuSystem[this.SelectedCompanyIndex].FemaleAnimals[this.rand.Next(0, this.WetuSystem[this.SelectedCompanyIndex].FemaleAnimals.Count)].AnimalId;
            }
            
        }

        private Animal SelectRandomAnimal()
        {
            if (this.WetuSystem[this.SelectedCompanyIndex].Animals.Count == 0)
            {
                return new Animal();
            }
            else
            {
                return this.WetuSystem[this.SelectedCompanyIndex].Animals[this.rand.Next(0, this.WetuSystem[this.SelectedCompanyIndex].Animals.Count)];
            }
            
        }

        private Animal SelectRandomAnimal(int NotSameAs)
        {
            if (this.WetuSystem[this.SelectedCompanyIndex].Animals.Count >= 2)
            {
                Animal selected = this.WetuSystem[this.SelectedCompanyIndex].Animals[this.rand.Next(0, this.WetuSystem[this.SelectedCompanyIndex].Animals.Count)];
                while (selected.AnimalId == NotSameAs)
                {
                    selected = this.WetuSystem[this.SelectedCompanyIndex].Animals[this.rand.Next(0, this.WetuSystem[this.SelectedCompanyIndex].Animals.Count)];
                }
                return selected;
            }

            return new Animal();
            
        }

        private int SelectRandomTube()
        {
            this.SelectedTube = this.rand.Next(0, this.WetuSystem[this.SelectedCompanyIndex].InseminationTubes.Count);
            return this.WetuSystem[this.SelectedCompanyIndex].InseminationTubes[this.SelectedTube].TubeId;
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

        private DateTime SelectRandomModifiedDate()
        {
            int Years = 0;
            int Months = 0;
            int Days = this.rand.Next(-31,1);
            int Hours = this.rand.Next(-12, 1);
            int Minutes = this.rand.Next(-60, 1);

            //...Select Year
            int RangeSelection = this.rand.Next(1, 1001);
            if(RangeSelection < 250)
            {
                Years = -2;
            }
            else
            {
                if((RangeSelection >=250) && (RangeSelection <= 750))
                {
                    Years = 0;
                }
                else
                {
                    Years = -1;
                }
            }

            RangeSelection = this.rand.Next(1, 1001);
            #region Month Select
            if (RangeSelection <= 83)
            {
                Months = -12;
            }
            else
            {
                if ((RangeSelection >= 84) && (RangeSelection <= 168))
                {
                    Months = -11;
                }
                else
                {
                    if ((RangeSelection >= 169) && (RangeSelection <= 252))
                    {
                        Months = -10;
                    }
                    else
                    {
                        if ((RangeSelection >= 253) && (RangeSelection <= 336))
                        {
                            Months = -9;
                        }
                        else
                        {
                            if ((RangeSelection >= 337) && (RangeSelection <= 420))
                            {
                                Months = -8;
                            }
                            else
                            {
                                if ((RangeSelection >= 421) && (RangeSelection <= 504))
                                {
                                    Months = -7;
                                }
                                else
                                {
                                    if ((RangeSelection >= 505) && (RangeSelection <= 588))
                                    {
                                        Months = -6;
                                    }
                                    else
                                    {
                                        if ((RangeSelection >= 589) && (RangeSelection <= 672))
                                        {
                                            Months = -5;
                                        }
                                        else
                                        {
                                            if ((RangeSelection >= 673) && (RangeSelection <= 756))
                                            {
                                                Months = -4;
                                            }
                                            else
                                            {
                                                if ((RangeSelection >= 757) && (RangeSelection <= 840))
                                                {
                                                    Months = -3;
                                                }
                                                else
                                                {
                                                    if ((RangeSelection >= 840) && (RangeSelection <= 924))
                                                    {
                                                        Months = -2;
                                                    }
                                                    else
                                                    {
                                                        if ((RangeSelection >= 925) && (RangeSelection <= 1000))
                                                        {
                                                            Months = -1;
                                                        }
                                                        else
                                                        {
                                                            Months = 0;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            #endregion

            DateTime ret = DateTime.Now.AddYears(Years).AddMonths(Months).AddDays(Days).AddHours(Hours).AddMinutes(Minutes);
            return ret;
        }

        private DateTime SelectRandomConnectedTime(DateTime EndDate)
        {
            int Seconds = this.rand.Next(-86401, 1);

            int Randomer = this.rand.Next(0, 10);
            if(Randomer != 0)
            {
                Seconds = Seconds / Randomer;
            }

            return EndDate.AddSeconds(Seconds);
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
                this.WetuSystem[this.SelectedCompanyIndex].Users.Add(result);
                Console.WriteLine("Company " + this.SelectedCompanyIndex.ToString() + " Added User: " + Name);
            }
            else
            {
                Console.WriteLine("Failed to insert User");
            }

        }

        public void AddUser(int CompanyIndex)
        {
            //this.SelectRandomCompany();
            string Name = GenerateRandomString(8);

            var values = new NameValueCollection();
            values["Username"] = Name;
            values["Password"] = "12345@qwerty";
            values["CompanyId"] = this.WetuSystem[CompanyIndex].CompanyId.ToString(); //this.SelectedCompany.ToString();

            int result = post.GetDataInstance<int>(this.PostUrl + URLs.AddUser, values);

            if (result != 0)
            {
                this.WetuSystem[this.SelectedCompanyIndex].Users.Add(result);
                Console.WriteLine("Company " + this.SelectedCompanyIndex.ToString() + " Added User: " + Name);
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

            if (this.SelectedUser != 0)
            {
                var values = new NameValueCollection();
                values["Address"] = GenerateRandomString(8);
                values["CompanyId"] = this.SelectedCompany.ToString();
                values["UserKey"] = this.SelectedUser.ToString();
                values["ModifiedDate"] = this.SelectRandomModifiedDate().ToString();

                int result = post.GetDataInstance<int>(this.PostUrl + URLs.AddDevice, values);

                Animal ins = new Animal();
                ins.AnimalId = result;
                ins.DeviceAddress = values["Address"];
                return ins;
            }
            else
            {
                this.AddUser(this.SelectedCompanyIndex);
                this.SelectRandomUser();

                var values = new NameValueCollection();
                values["Address"] = GenerateRandomString(8);
                values["CompanyId"] = this.WetuSystem[this.SelectedCompanyIndex].CompanyId.ToString();
                values["UserKey"] = this.SelectedUser.ToString();
                values["ModifiedDate"] = this.SelectRandomModifiedDate().ToString();

                int result = post.GetDataInstance<int>(this.PostUrl + URLs.AddDevice, values);

                Animal ins = new Animal();
                ins.AnimalId = result;
                ins.DeviceAddress = values["Address"];
                return ins;
            }
        }

        private Animal AddDevice(int CompanyIndex)
        {
            this.SelectRandomUser();

            if (this.SelectedUser != 0)
            {
                var values = new NameValueCollection();
                values["Address"] = GenerateRandomString(8);
                values["CompanyId"] = this.WetuSystem[CompanyIndex].CompanyId.ToString();
                values["UserKey"] = this.SelectedUser.ToString();
                values["ModifiedDate"] = this.SelectRandomModifiedDate().ToString();

                int result = post.GetDataInstance<int>(this.PostUrl + URLs.AddDevice, values);

                Animal ins = new Animal();
                ins.AnimalId = result;
                ins.DeviceAddress = values["Address"];
                return ins;
            }
            else
            {
                this.AddUser(this.SelectedCompanyIndex);
                this.SelectRandomUser();

                var values = new NameValueCollection();
                values["Address"] = GenerateRandomString(8);
                values["CompanyId"] = this.WetuSystem[CompanyIndex].CompanyId.ToString();
                values["UserKey"] = this.SelectedUser.ToString();
                values["ModifiedDate"] = this.SelectRandomModifiedDate().ToString();

                int result = post.GetDataInstance<int>(this.PostUrl + URLs.AddDevice, values);

                Animal ins = new Animal();
                ins.AnimalId = result;
                ins.DeviceAddress = values["Address"];
                return ins;
            }

        }

        private Animal AddChildDevice()
        {
            var values = new NameValueCollection();
            values["Address"] = GenerateRandomString(8);
            values["CompanyId"] = this.SelectedCompany.ToString();
            values["UserKey"] = this.SelectedUser.ToString();
            values["ModifiedDate"] = this.SelectRandomModifiedDate().ToString();

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
                Console.WriteLine("Company " + this.SelectedCompanyIndex.ToString() + " Added Device: " + ins.DeviceAddress);

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
                values["ModifiedDate"] = this.SelectRandomModifiedDate().ToString();

                int result = post.GetDataInstance<int>(this.PostUrl + URLs.AddAnimal, values);

                if (result != 0)
                {                    
                    ins.AnimalId = result;
                    this.WetuSystem[this.SelectedCompanyIndex].Animals.Add(ins);
                    Console.WriteLine("Company " + this.SelectedCompanyIndex.ToString() + " Added Animal: " + Name + " with Device - " + ins.DeviceAddress);

                    if(SexId == 1)
                    {
                        this.WetuSystem[this.SelectedCompanyIndex].MaleAnimals.Add(ins);
                    }
                    else
                    {
                        this.WetuSystem[this.SelectedCompanyIndex].FemaleAnimals.Add(ins);
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

        public void AddAnimal(int CompanyIndex)
        {
            Animal ins = new Animal();
            ins = this.AddDevice(CompanyIndex);

            if (ins.AnimalId != 0)
            {
                Console.WriteLine("Company " + this.SelectedCompanyIndex.ToString() + " Added Device: " + ins.DeviceAddress);

                int SexId = this.rand.Next(1, 3);
                var values = new NameValueCollection();
                string Name = GenerateRandomString(8);
                values["Name"] = Name;
                values["Tag"] = GenerateRandomString(8);
                values["DeviceId"] = ins.AnimalId.ToString();
                values["SexId"] = SexId.ToString();
                values["Species"] = this.SelectRandomSpecies().ToString();
                values["CompanyId"] = this.WetuSystem[CompanyIndex].CompanyId.ToString();
                values["UserKey"] = this.SelectedUser.ToString();
                values["ModifiedDate"] = this.SelectRandomModifiedDate().ToString();

                int result = post.GetDataInstance<int>(this.PostUrl + URLs.AddAnimal, values);

                if (result != 0)
                {
                    ins.AnimalId = result;
                    this.WetuSystem[this.SelectedCompanyIndex].Animals.Add(ins);
                    Console.WriteLine("Company " + this.SelectedCompanyIndex.ToString() + " Added Animal: " + Name + " with Device - " + ins.DeviceAddress);

                    if (SexId == 1)
                    {
                        this.WetuSystem[this.SelectedCompanyIndex].MaleAnimals.Add(ins);
                    }
                    else
                    {
                        this.WetuSystem[this.SelectedCompanyIndex].FemaleAnimals.Add(ins);
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

        public int AddChild()
        {
            Animal ins = new Animal();
            ins = this.AddChildDevice();

            if (ins.AnimalId != 0)
            {
                Console.WriteLine("Company " + this.SelectedCompanyIndex.ToString() + " Added Device: " + ins.DeviceAddress);

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
                values["ModifiedDate"] = this.SelectRandomModifiedDate().ToString();

                int result = post.GetDataInstance<int>(this.PostUrl + URLs.AddAnimal, values);

                if (result != 0)
                {
                    ins.AnimalId = result;
                    this.WetuSystem[this.SelectedCompanyIndex].Animals.Add(ins);
                    Console.WriteLine("Company " + this.SelectedCompanyIndex.ToString() + " Added Animal: " + Name + " with Device - " + ins.DeviceAddress);

                    if (SexId == 1)
                    {
                        this.WetuSystem[this.SelectedCompanyIndex].MaleAnimals.Add(ins);
                    }
                    else
                    {
                        this.WetuSystem[this.SelectedCompanyIndex].FemaleAnimals.Add(ins);
                    }

                    return result;
                }
                else
                {
                    Console.WriteLine("Failed to insert Animal");
                    return result;
                }
            }
            else
            {
                Console.WriteLine("Failed to insert Device");
                return 0;
            }
        }

        public void AddTube()
        {
            this.SelectRandomCompany();
            this.SelectRandomUser();

            if (this.SelectedUser != 0)
            {
                int AnimalId = this.SelectRandomMaleAnimal();
                if (AnimalId != 0)
                {

                    var values = new NameValueCollection();
                    values["AnimalId"] = AnimalId.ToString();
                    values["CompanyId"] = this.SelectedCompany.ToString();
                    values["UserKey"] = this.SelectedUser.ToString();
                    values["ModifiedDate"] = this.SelectRandomModifiedDate().ToString();

                    int result = post.GetDataInstance<int>(this.PostUrl + URLs.AddTube, values);

                    if (result != 0)
                    {
                        Tube ins = new Tube();
                        ins.TubeId = result;
                        ins.AnimalId = AnimalId;
                        this.WetuSystem[this.SelectedCompanyIndex].InseminationTubes.Add(ins);
                        Console.WriteLine("Company " + this.SelectedCompanyIndex.ToString() + " Added Tube: " + result.ToString() + " from - " + ins.AnimalId);
                    }
                    else
                    {
                        Console.WriteLine("Failed to insert Insemination Tube");
                    }
                }
            }
        }

        public void AddToPublicRegistrar()
        {
            this.SelectRandomCompany();
            this.SelectRandomUser();

            if (this.SelectedUser != 0)
            {
                int AnimalId = this.SelectRandomMaleAnimal();

                if (AnimalId != 0)
                {

                    string RegNo = GenerateRandomString(6);
                    var values = new NameValueCollection();

                    values["AnimalId"] = AnimalId.ToString();
                    values["RegNo"] = RegNo;
                    values["UserKey"] = this.SelectedUser.ToString();
                    values["ModifiedDate"] = this.SelectRandomModifiedDate().ToString();

                    int result = post.GetDataInstance<int>(this.PostUrl + URLs.AddToPublic, values);

                    if (result != 0)
                    {
                        this.PublicRegistrar.Add(result);
                        Console.WriteLine("Added Animal: " + AnimalId + " to Public Registrar - " + result.ToString());
                    }
                    else
                    {
                        Console.WriteLine("Failed to add to Public Registrar");
                    }
                }
            }
        }

        public void CreateBirth()
        {
            this.SelectRandomCompany();
            this.SelectRandomUser();

            if (this.SelectedUser != 0)
            {
                //...Make sure there is at least 1 male and female
                if (this.WetuSystem[this.SelectedCompanyIndex].FemaleAnimals.Count == 0)
                {
                    Console.WriteLine("Failed to add Birth Scenario: No Female Animals");
                }
                else
                {
                    //...Select Female Parent
                    int Female = this.SelectRandomFemaleAnimal();

                    if (Female != 0)
                    {
                        int Male = 0;
                        int Child = 0;
                        int Success = 0;
                        int Tube = 0;

                        //...Select Birth Type
                        //...1 = Natural, 2 = AI
                        int BirthType = this.rand.Next(1, 3);

                        //...Make sure Company Has Insemination Tubes
                        if (BirthType == 2)
                        {
                            if (this.WetuSystem[this.SelectedCompanyIndex].InseminationTubes.Count == 0)
                            {
                                BirthType = 1;
                            }
                        }
                        else
                        {
                            if (this.WetuSystem[this.SelectedCompanyIndex].MaleAnimals.Count == 0)
                            {
                                if (this.WetuSystem[this.SelectedCompanyIndex].InseminationTubes.Count == 0)
                                {
                                    Console.WriteLine("Failed to add Birth Scenario: No Male Animals");
                                }
                                else
                                {
                                    BirthType = 2;
                                }
                            }
                        }

                        if (BirthType == 1)
                        {
                            //...Natural Insemination
                            Male = this.SelectRandomMaleAnimal();

                            //...Determine Success
                            int SuccessSelect = this.rand.Next(1, 101);

                            if ((SuccessSelect >= 25) && (SuccessSelect <= 75))
                            {
                                //...Successful birth
                                //...Create New Child
                                Child = this.AddChild();
                                Success = 1;
                            }
                            else
                            {
                                Child = 0;
                                Success = 0;
                            }
                        }
                        else
                        {
                            //...Select Insemination Tube
                            Tube = this.SelectRandomTube();
                            Male = this.WetuSystem[this.SelectedCompanyIndex].InseminationTubes[this.SelectedTube].AnimalId;

                            //...Determine Success
                            int SuccessSelect = this.rand.Next(1, 101);

                            if ((SuccessSelect >= 25) && (SuccessSelect <= 75))
                            {
                                //...Successful birth
                                //...Create New Child
                                Child = this.AddChild();
                                Success = 1;
                            }
                            else
                            {
                                Child = 0;
                                Success = 0;
                            }
                        }

                        //...Insert
                        var values = new NameValueCollection();
                        values["FemaleId"] = Female.ToString();
                        values["MaleId"] = Male.ToString();
                        values["ChildId"] = Child.ToString();
                        values["TubeId"] = Tube.ToString();
                        values["BirthTypeId"] = BirthType.ToString();
                        values["Success"] = Success.ToString();
                        values["CompanyId"] = this.SelectedCompany.ToString();
                        values["UserKey"] = this.SelectedUser.ToString();
                        values["ModifiedDate"] = this.SelectRandomModifiedDate().ToString();

                        int result = post.GetDataInstance<int>(this.PostUrl + URLs.AddBirth, values);

                        if (result != 0)
                        {
                            if (Tube != 0)
                            {
                                Tube toRemove = new Tube();
                                toRemove.AnimalId = Male;
                                toRemove.TubeId = Tube;
                                this.WetuSystem[this.SelectedCompanyIndex].InseminationTubes.Remove(toRemove);
                            }

                            Console.WriteLine("Birth was added");
                        }
                        else
                        {
                            Console.WriteLine("Failed to add Birth Scenario");
                        }
                    }
                }
            }
        }

        public void LogProximity()
        {
            if (this.WetuSystem[this.SelectedCompanyIndex].Animals.Count >= 2)
            {
                DateTime EndDate = this.SelectRandomModifiedDate();
                DateTime StartDate = this.SelectRandomConnectedTime(EndDate);

                this.SelectRandomCompany();

                Animal AnimalA = this.SelectRandomAnimal();

                if (AnimalA.AnimalId != 0)
                {
                    Animal AnimalB = this.SelectRandomAnimal(AnimalA.AnimalId);

                    var values = new NameValueCollection();
                    values["DeviceReceivedAddress"] = AnimalA.DeviceAddress;
                    values["DeviceConnectedAddress"] = AnimalB.DeviceAddress;
                    values["ConncetionStart"] = StartDate.ToString();
                    values["ConnectionEnd"] = EndDate.ToString();

                    int result = post.GetDataInstance<int>(this.PostUrl + URLs.LogProximity, values);

                    Console.WriteLine("Proximity Between " + AnimalA.AnimalId.ToString() + " and " + AnimalB.AnimalId.ToString() + " logged");
                }
            }
            else
            {
                this.AddAnimal(this.SelectedCompanyIndex);
                this.LogProximity();
            }
        }

        public void LogMovement()
        {
            this.SelectRandomCompany();

            Animal AnimalId = this.SelectRandomAnimal();

            if (AnimalId.AnimalId != 0)
            {
                int Axis = this.rand.Next(1, 4);

                var values = new NameValueCollection();
                values["DeviceAddress"] = AnimalId.DeviceAddress;
                values["Axis"] = Axis.ToString();
                values["ModifiedDate"] = this.SelectRandomModifiedDate().ToString();

                int result = post.GetDataInstance<int>(this.PostUrl + URLs.LogMovement, values);

                string Ax = "";
                if (Axis == 1)
                {
                    Ax = "X";
                }
                else
                {
                    if (Axis == 2)
                    {
                        Ax = "Y";
                    }
                    else
                    {
                        Ax = "Z";
                    }
                }

                Console.WriteLine("Movement from " + AnimalId.AnimalId.ToString() + " in " + Ax + "-Axis logged");
            }
        }
    }
}
