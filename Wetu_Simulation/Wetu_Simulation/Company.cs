using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wetu_Simulation
{
    class Company
    {
        private PostRepository post = new PostRepository();
        private string PostUrl { get; set; }

        public Company() { }
        public Company(int _CompanyId, string _PostUrl)
        {
            this.CompanyId = _CompanyId;
            this.PostUrl = _PostUrl;

            this.SetUsers();
            this.SetAnimals();
            this.SetInseminationTubes();

            if(this.Users == null)
            {
                this.Users = new List<int>();
            }

            

            if(this.Animals == null)
            {
                this.Animals = new List<Animal>();
            }

            if(this.InseminationTubes == null)
            {
                this.InseminationTubes = new List<Tube>();
            }
        }

        #region Company Identification
        public int CompanyId { get; set; }          //...Identifier for Company        
        #endregion

        #region Users
        public List<int> Users { get; set; }                           //...Users linked to Company

        private void SetUsers()
        {
            var values = new NameValueCollection();
            values["CompanyId"] = this.CompanyId.ToString();

            this.Users = post.GetDataList<int>(this.PostUrl + URLs.GetUsers, values);
        }
        #endregion

        #region Animals
        public List<Animal> Animals { get; set; }                      //...Animal linked to Company
        public List<Animal> MaleAnimals { get; set; }                  //...Male animals of Company
        public List<Animal> FemaleAnimals { get; set; }                //...Female animals of Company
        public List<Animal> ParentlessAnimals { get; set; }            //...Animals not linked with a parent

        private void SetAnimals()
        {
            this.SetMaleAnimals();
            this.SetFemaleAnimals();

            if (this.MaleAnimals == null)
            {
                this.MaleAnimals = new List<Animal>();
            }

            if (this.FemaleAnimals == null)
            {
                this.FemaleAnimals = new List<Animal>();
            }

            this.Animals = this.MaleAnimals.Concat(this.FemaleAnimals).ToList();
        }

        private void SetMaleAnimals()
        {
            var values = new NameValueCollection();
            values["CompanyId"] = this.CompanyId.ToString();

            this.MaleAnimals = post.GetDataList<Animal>(this.PostUrl + URLs.GetMaleAnimals, values);
        }

        private void SetFemaleAnimals()
        {
            var values = new NameValueCollection();
            values["CompanyId"] = this.CompanyId.ToString();

            this.FemaleAnimals = post.GetDataList<Animal>(this.PostUrl + URLs.GetFemaleAnimals, values);
        }
        #endregion

        #region Birthing
        public List<Tube> InseminationTubes { get; set; }                //...Inseminations Tubes of Company

        private void SetInseminationTubes()
        {
            var values = new NameValueCollection();
            values["CompanyId"] = this.CompanyId.ToString();

            this.InseminationTubes = post.GetDataList<Tube>(this.PostUrl + URLs.GetTubes, values);
        }
        #endregion
    }

    
}
