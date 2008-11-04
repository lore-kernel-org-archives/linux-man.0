From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: open(2) O_CLOEXEC conformance
Date: Tue, 04 Nov 2008 08:52:33 -0500
Message-ID: <491053A1.3070409@gmail.com>
References: <18700.47875.253812.747339@a1ihome1.kph.uni-mainz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <18700.47875.253812.747339-0zhoq7ouC9zS3T3piCV0zGenuTSeXgcCs0AfqQuZ5sE@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulrich Mueller <ulm-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Ulrich,

Ulrich Mueller wrote:
> man-pages-3.11
> 
> Section "CONFORMING TO" of open(2) contradicts itself:
> 
>    The O_CLOEXEC flag is not specified in POSIX.1-2001,
>    but is specified in POSIX.1-2001.

Yes.  the second of these should have been POSIX.1-2008.  Thanbks
for spotting that.  Fixed for 3.13.

Thanks,

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
