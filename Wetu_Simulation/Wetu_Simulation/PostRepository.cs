using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Collections.Specialized;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace Wetu_Simulation
{
    class PostRepository
    {
        public int PostData(string URL, NameValueCollection data)
        {
            int ReturnId = 0;
            using (var client = new WebClient())
            {
                var response = client.UploadValues(URL, data);
                var responseString = Encoding.Default.GetString(response);
                ReturnId = Convert.ToInt32(responseString);
            }
            return ReturnId;
        }

        public T GetDataInstance<T>(string URL, NameValueCollection data) where T : new()
        {
            T returns = new T();

            using (var client = new WebClient())
            {
                var response = client.UploadValues(URL, data);
                var responseString = Encoding.Default.GetString(response);

                returns = Deserial_Json<T>(responseString);
            }

            return returns;
        }

        public List<T> GetDataList<T>(string URL) where T : new()
        {
            List<T> returns = new List<T>();

            using (var client = new WebClient())
            {
                var response = client.DownloadData(URL);
                var responseString = Encoding.Default.GetString(response);

                returns = Deserial_Json<List<T>>(responseString);
            }

            return returns;
        }

        public List<T> GetDataList<T>(string URL, NameValueCollection data) where T : new()
        {
            List<T> returns = new List<T>();

            using (var client = new WebClient())
            {
                var response = client.UploadValues(URL, data);
                var responseString = Encoding.Default.GetString(response);

                returns = Deserial_Json<List<T>>(responseString);
            }

            return returns;
        }

        private static T Deserial_Json<T>(string json) where T : new()
        {
            return !string.IsNullOrEmpty(json) ? JsonConvert.DeserializeObject<T>(json) : new T();
        }
    }
}
