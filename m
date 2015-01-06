From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] mem.4: correct /dev/port group in example
Date: Tue, 06 Jan 2015 11:44:28 +0100
Message-ID: <54ABBC8C.8070301@gmail.com>
References: <1420204298-25625-1-git-send-email-eliedebrauwer@gmail.com> <1420204298-25625-3-git-send-email-eliedebrauwer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420204298-25625-3-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/02/2015 02:11 PM, Elie De Brauwer wrote:
> mem.4 mentions that group for /dev/port should be set to 'mem' however
> all other files (/dev/mem and /dev/kmem) use the kmem group in their
> examples and on my system /dev/port belongs to kmem. Hence the 'mem'
> group was probably a typo:

Sounds reasonable to me. Patch Applied. Thanks, Elie.

Cheers,

Michael



> edb@lapelidb:~$ cat /etc/group | grep -i mem
> kmem:x:15:
> edb@lapelidb:~$ ls -al /dev/port
> crw-r----- 1 root kmem 1, 4 Jan  2 10:00 /dev/port
> 
> Signed-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man4/mem.4 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man4/mem.4 b/man4/mem.4
> index fef007e..6688345 100644
> --- a/man4/mem.4
> +++ b/man4/mem.4
> @@ -76,7 +76,7 @@ It is typically created by:
>  .sp
>  mknod \-m 660 /dev/port c 1 4
>  .br
> -chown root:mem /dev/port
> +chown root:kmem /dev/port
>  .RE
>  .SH FILES
>  .I /dev/mem
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
