using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ReMoBi_DCSN.Models
{
    public class PostImageViewModel
    {
        public Post Post { get; set; }
        public List<image> Images { get; set; }
    }

}