From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: readlink(2) handling of empty strings
Date: Tue, 30 Sep 2014 10:10:02 +0200
Message-ID: <542A655A.3090406@gmail.com>
References: <1412033603.9388.68.camel@decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412033603.9388.68.camel-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Hutchings <ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Ben,

On 09/30/2014 01:33 AM, Ben Hutchings wrote:
> readlink(2) claims:
> 
>        Since  Linux 2.6.39, pathname can be an empty string, in which case the
>        call operates on the file referred to by dirfd  (which  may  have  been
>        obtained using the open(2) O_PATH flag).  In this case, dirfd can refer
>        to any type of file, not just a directory.
> 
> The last sentence seems to be incorrect.  dirfd must refer to a symlink
> that has been opened using the O_PATH flag.  (The symlink could refer to
> a file, directory, or nothing, but opening with O_PATH doesn't resolve
> it.)

Yes, you must be right. The existing text makes no sense; I suspect
a cut-and-paste error as I went through updating some of the *at.2 pages.
I've changed the text to:

       Since  Linux  2.6.39,  pathname  can be an empty string, in which
       case the call operates on the symbolic link referred to by  dirfd
       (which  should have have been obtained using the open(2) with the
       O_PATH and O_NOFOLLOW flags).

Okay?

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
