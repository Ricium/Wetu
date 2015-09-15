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

        public Simulation() { }
        public Simulation(string _PostUrl)
        {
            this.PostUrl = "http://" + _PostUrl;
        }

        public int [] GetCompanies()
        {
            var values = new NameValueCollection();
            values["UserKey"] = "10";

            List<int> companies = post.GetDataList<int>(this.PostUrl + URLs.GetCompany, values);

            return companies.ToArray();
        }
    }
}
