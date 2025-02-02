using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace examination_system
{
    internal class ConfigLoader
    {
        internal static string? LoadConfig(string jsonKey)
        {
            return JObject.Parse(File.ReadAllText(".appSettings.json"))[jsonKey]?.ToString();
        }
    }
}
