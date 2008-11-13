From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_setaffinity_np.3
Date: Wed, 12 Nov 2008 21:30:06 -0500
Message-ID: <cfd18e0f0811121830u3dc6ea30va0298bdbedf1f2fb@mail.gmail.com>
References: <cfd18e0f0811041447w57dd5de4he68ca780ed963074@mail.gmail.com>
	 <4916133A.8060209@domaigne.com>
	 <36ca99e90811101038v62348fc0mbb366219168bf2ff@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36ca99e90811101038v62348fc0mbb366219168bf2ff-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Bert,

>>> The argument
>>> .I cpusetsize
>>> is the length (in bytes) of the buffer pointed to by
>>> .IR cpuset .
>>> Normally this argument would be specified as
>>> .IR sizeof(cpu_set_t) .
>>> The constant
>>> .B CPU_SETSIZE
>>> specifies a value one greater than the
>>> maximum CPU number that can be stored in a CPU set.
>>
>> I came independently to the same conclusion than you. AFAICS,glibc defines
>> the cpu_set_t to be a 1024 bits long structure. But the kernel defines the
>> corresponding structure to be a bit field of appropriate length to store
>> NR_CPUS.
>>
>> Interesting enough, the exact size of the kernel structure is determined by
>> the glibc on the 1st call to pthread_setaffinity_np().
>>
>> We'll run into troubles if run this on a server with more than 1K core ;-)
> Thats why glibc provides a new set of function to handle cpu_set_t
> with more than 1K bits.
> Look for the definitions of macros with a _S suffix in <sched.h>.

Thanks for alerting me to this.  Of course those macros need
documenting.  I've pretty much completed a page documenting them.
Would you be willing to check it over?

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
