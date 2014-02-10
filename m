From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] nscd.conf.5: add note about default values
Date: Mon, 10 Feb 2014 10:44:34 +0100
Message-ID: <52F89F82.5010508@redhat.com>
References: <52F207BE.5090805@redhat.com> <52F4E416.8080900@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000404020006060404020804"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52F4E416.8080900-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------000404020006060404020804
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/14 14:48, Michael Kerrisk (man-pages) wrote:
> On 02/05/2014 10:43 AM, Peter Schiffer wrote:
>> Hello,
>>
>> this patch adds note to the nscd.conf(5) man page about default values,
>> stating that default values originate from nscd(8) source code and that
>> default values used in the nscd.conf(5) file in distribution might
>
> Thanks, Peter.
>
> Applied.
>
> Cheers,
>
> Michael
>

Michael,

there's now one little typo on the man page, see attached patch.

peter

--------------000404020006060404020804
Content-Type: text/x-patch;
 name="nscd.conf.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="nscd.conf.patch"

diff --git a/man5/nscd.conf.5 b/man5/nscd.conf.5
index d573a13..f9208e1 100644
--- a/man5/nscd.conf.5
+++ b/man5/nscd.conf.5
@@ -233,7 +233,7 @@ and
 The default values stated in this manual page originate
 from the source code of
 .BR nscd (8)
-and are used if not overriden in ithe configuration file.
+and are used if not overriden in the configuration file.
 The default values used in the configuration file of
 your distribution might differ.
 .SH SEE ALSO

--------------000404020006060404020804--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
