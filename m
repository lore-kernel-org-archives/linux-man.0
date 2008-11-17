From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: pthread_setaffinity_np.3
Date: Mon, 17 Nov 2008 12:15:24 -0500
Message-ID: <cfd18e0f0811170915n4d11a290j4cb9ed57281ea11f@mail.gmail.com>
References: <cfd18e0f0811041447w57dd5de4he68ca780ed963074@mail.gmail.com>
	 <4916133A.8060209@domaigne.com>
	 <cfd18e0f0811140704l18e5741fgdbb5a6c52fb8cbe7@mail.gmail.com>
	 <cfd18e0f0811140750r5a22255bx7bd53c580b42cc6@mail.gmail.com>
	 <491F25D1.8020007@domaigne.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <491F25D1.8020007-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, Nov 15, 2008 at 2:41 PM, Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org> wrote:
> Hi Michael!
>
> Looks good to me. I have only one minor comment left, regarding EINVAL for
> pthread_setaffinity_np():
>
>> .TP
>> .BR EINVAL
>> .RB ( pthread_setaffinity_np ())
>> .I cpuset
>> specified a CPU that was outside the set supported by the kernel.
>> (The kernel configuration option
>> .BR CONFIG_NR_CPUS
>> defines the range of the set supported by the kernel data type
>> .\" cpumask_t
>> used to represent CPU sets.)
>> .\" The raw sched_getaffinity() system call returns the size (in bytes)
>> .\" of the cpumask_t type.
>
> In the light of Bert's comment, it seems that the Linux kernel folks wants
> to make the cpumask_t dynamic. So CONFIG_NR_CPUS might become obsolete in
> the future...
>
> But for now, your explanation is fine.

Okay.  Thanks for the info Loic.

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
