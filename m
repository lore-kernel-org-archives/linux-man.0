From: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Subject: st_size of a symlink
Date: Mon, 23 Jul 2012 17:55:43 +0200
Message-ID: <500D73FF.1070504@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!

lstat(2) on /proc/$pid/exe gives me a stat object where st_size is 0.

Or:
rw@mantary:~> ls -l /proc/$$/exe
lrwxrwxrwx 1 rw users 0 23. Jul 17:02 /proc/16902/exe -> /bin/bash

The lstat(2) manpage says:
"The st_size field gives the size of the file (if it is a regular file 
or a symbolic link) in bytes.  The size of a symbolic link is the length 
of the pathname it contains, without a terminating null byte."

This property is also used in the example in the readlink(2) manpage.

Is this a procfs issue or is the manpage wrong?

Thanks,
//richard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
