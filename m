From: "Michael Kerrisk" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RLIMIT_RTTIME documentation for getrlimit.2
Date: Mon, 28 Apr 2008 14:14:46 +0200
Message-ID: <517f3f820804280514p16cb5658ree503816bca20ca3@mail.gmail.com>
References: <20080208145950.GA3910@kernel.sg> <1207904485.7074.28.camel@twins>
	 <cfd18e0f0804110216l3c679bb6ned83f5d58d1c9d66@mail.gmail.com>
	 <1207905668.7074.32.camel@twins>
	 <cfd18e0f0804110227w37915734r8ca31271a3dfc8ab@mail.gmail.com>
	 <1207906325.7153.2.camel@twins>
	 <cfd18e0f0804110238l66fb60c8pa8ac934a2a43baa7@mail.gmail.com>
	 <4808D1CC.80103@gmail.com>
	 <cfd18e0f0804280444jd558060g6cf5ee7df0248ee1@mail.gmail.com>
	 <1209384560.13978.9.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1209384560.13978.9.camel@twins>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Eugene Teo <eugeneteo-X4ZF2iejbADYtjvyW6yDsg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

>  > Below is the draft text that I will add to the getrlimit.2 man page to describe
>  > RLIMIT_RTTIME.  Does it look okay to you?  (I will add a pointer in
>  > sched_setscheduler.2 to this description in getrlimit.2.)
>  >
>  >       RLIMIT_RTTIME (Since Linux 2.6.25)
>  >              Specifies a limit on the amount of CPU time that a
>  >              process  scheduled  under  a  real-time scheduling
>  >              policy may consume without making a blocking  sys-
>  >              tem  call.   For  the  purpose of this limit, each
>  >              time a process makes a blocking system  call,  the
>  >              count  of  its consumed CPU time is reset to zero.
>  >              The CPU time count is not  reset  if  the  process
>  >              continues  trying to use the CPU but is preempted,
>  >              its   time   slice   expires,    or    it    calls
>  >              sched_yield(2).
>  >
>  >              Upon  reaching the soft limit, the process is sent
>  >              a SIGXCPU  signal.   If  the  process  catches  or
>  >              ignores  this  signal  and continues consuming CPU
>  >              time, then SIGXCPU will  be  generated  once  each
>  >              second  until  the hard limit is reached, at which
>  >              point the process is sent a SIGKILL signal.
>  >
>  >              The intended use of this limit is to stop  a  run-
>  >              away real-time process from locking up the system.
>
>
> Looks excellent, thanks!

Good -- thanks for checking it over.

>  Acked-by: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
>
>  in so far that is applicable to man pages ;-)

It works for me.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
