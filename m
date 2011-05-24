From: Eugen Dedu <Eugen.Dedu-C66Sk7uXGWIalAAbUx3MVP3zm4ADWneb@public.gmane.org>
Subject: Trivial fix for iso_8859-1.7 man page
Date: Tue, 24 May 2011 18:08:03 +0200
Message-ID: <4DDBD7E3.5020608@pu-pm.univ-fcomte.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, joey-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=156154 is about a minor 
issue in iso_8859-1.7 man page.

I added a 1-line patch to fix it 
(http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=156154#19), please 
apply it so that it can be closed.

snoopy:~$ dpkg -l manpages
[...]
ii  manpages            3.27-1              Manual pages about using a 
GNU/Linux system

Cheers,
-- 
Eugen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
