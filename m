From: "Juliano F. Ravasi" <ml-3xekma+8Mi6ZuzBka8ofvg@public.gmane.org>
Subject: Problem in proc(5), regarding loadavg
Date: Mon, 25 May 2009 15:22:09 -0300
Message-ID: <4A1AE1D1.4080006@juliano.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

I found that the information on proc(5) in the latest version of
man-pages (3.21) do not seem to match the real implementation, regardin=
g
the file /proc/loadavg.

The manual page says that:

	"The first of these [the two numbers of the fourth field] is the
	number of currently executing kernel scheduling entities
	(processes, threads); this will be less than or equal to the
	number of CPUs."

By looking at the implementation in (v2.6.29)/fs/proc/loadavg.c, this
field returns the value of `nr_running()', which is defined in
/kernel/sched.c and returns the current number of *runnable* threads. I=
t
is easily verifiable that this value may and will be greater the number
of CPUs if you start a number of processing-intensive threads, then
inspect /proc/loadavg.

Best regards,
Juliano.


--=20
Juliano F. Ravasi =B7=B7 http://juliano.info/
5105 46CC B2B7 F0CD 5F47 E740 72CA 54F4 DF37 9E96

"A candle loses nothing by lighting another candle." -- Erin Majors
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
