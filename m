From: =?iso-8859-1?Q?Per_B=F6hlin?= <Per.Bohlin-MFMeSrSslgZWk0Htik3J/w@public.gmane.org>
Subject: man5/core.5 Piping core dumps to a program: ulimit -c restrictions
 does not apply when using pipe
Date: Mon, 9 Oct 2017 15:22:00 +0000
Message-ID: <d0d944e3f79246c28100f1d7fe042d7e@zenterio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The man page for coredumps:
http://man7.org/linux/man-pages/man5/core.5.html

In section: Piping core dumps to a program
should probably have a bullet explaining that the size limit imposed by ulimit -c does not apply when using the pipe-mechanism.

Thanks,

Per Böhlin
Chief Architect QA Frameworks & Tools
Engineering Services

Zenterio AB
Diskettgatan 11B
583 35 Linköping

M: +46 (0) 707895827
E: per.bohlin-MFMeSrSslgZWk0Htik3J/w@public.gmane.org

www.zenterio.com
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
