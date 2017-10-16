From: Richard Knutsson <richard.knutsson-Yzag3CzIk2SzQB+pC5nmwQ@public.gmane.org>
Subject: stat(2): use lstat instead of stat in the example?
Date: Mon, 16 Oct 2017 15:27:26 +0200
Message-ID: <4973d2be-3dda-5379-5c75-18f2ba7861cf@abelko.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

A college of mine was having a problem with the example-code on the 
stat/lstat/fstat-page, since it would never report a file as "symlink". 
It was a mistake on his part but is there a reason to use stat() instead 
of lstat() when the latter gives the expected result, IMHO?

Best regards,
Richard Knutsson

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
