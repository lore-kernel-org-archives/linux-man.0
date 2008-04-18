From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: RLIMIT_RTTIME documentation for getrlimit.2
Date: Fri, 18 Apr 2008 18:52:28 +0200
Message-ID: <4808D1CC.80103@gmail.com>
References: <20080208145950.GA3910@kernel.sg> <1202483445.6292.1.camel@lappy>	 <517f3f820802280712o3d756b4fq46461b226515e1f2@mail.gmail.com>	 <1204212100.12120.9.camel@twins>	 <cfd18e0f0804110156l658107e5x1f2695cacfc3ac75@mail.gmail.com>	 <1207904485.7074.28.camel@twins>	 <cfd18e0f0804110216l3c679bb6ned83f5d58d1c9d66@mail.gmail.com>	 <1207905668.7074.32.camel@twins>	 <cfd18e0f0804110227w37915734r8ca31271a3dfc8ab@mail.gmail.com>	 <1207906325.7153.2.camel@twins> <cfd18e0f0804110238l66fb60c8pa8ac934a2a43baa7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0804110238l66fb60c8pa8ac934a2a43baa7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
Cc: Eugene Teo <eugeneteo-X4ZF2iejbADYtjvyW6yDsg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Peter,

Below is the draft text that I will add to the getrlimit.2 man page to describe
RLIMIT_RTTIME.  Does it look okay to you?  (I will add a pointer in
sched_setscheduler.2 to this description in getrlimit.2.)

       RLIMIT_RTTIME (Since Linux 2.6.25)
              Specifies a limit on the amount of CPU time that a
              process  scheduled  under  a  real-time scheduling
              policy may consume without making a blocking  sys-
              tem  call.   For  the  purpose of this limit, each
              time a process makes a blocking system  call,  the
              count  of  its consumed CPU time is reset to zero.
              The CPU time count is not  reset  if  the  process
              continues  trying to use the CPU but is preempted,
              its   time   slice   expires,    or    it    calls
              sched_yield(2).

              Upon  reaching the soft limit, the process is sent
              a SIGXCPU  signal.   If  the  process  catches  or
              ignores  this  signal  and continues consuming CPU
              time, then SIGXCPU will  be  generated  once  each
              second  until  the hard limit is reached, at which
              point the process is sent a SIGKILL signal.

              The intended use of this limit is to stop  a  run-
              away real-time process from locking up the system.

Cheers,

Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
