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

        public Company() { }
        public Company(int _CompanyId)
        {
            this.CompanyId = _CompanyId;
        }

        #region Company Identification
        public int CompanyId { get; set; }          //...Identifier for Company
        public string CompanyName { get; set; }

        
        #endregion

        #region Users
        public List<int> Users { get; set; }                           //...Users linked to Company

        public void SetUsers()
        {

        }

        public void AddUser(string Username, string Password)                       //...Create new user for Company
        {
            var values = new NameValueCollection();
            values["Username"] = Username;
            values["Password"] = Password;
            values["CompanyName"] = this.CompanyName;

            int UserId = post.PostData("Simulate", values);

        }
        #endregion

        #region Animals
        public List<Animal> Animals { get; set; }                      //...Animal linked to Company
        public List<Animal> MaleAnimals { get; set; }                  //...Male animals of Company
        public List<Animal> FemaleAnimals { get; set; }                //...Female animals of Company
        public List<Animal> ParentlessAnimals { get; set; }            //...Animals not linked with a parent
        #endregion

        #region Birthing
        public List<int> InseminationTubes { get; set; }                //...Inseminations Tubes of Company
        #endregion
    }

    
}
