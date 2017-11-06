From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] proc.5: Clarify permissions in /proc/[pid]/fd/
Date: Mon, 6 Nov 2017 22:27:11 +0100
Message-ID: <3dae1129-425e-f5b7-d27d-f5de35b45035@gmail.com>
References: <20171105190451.16059-1-mail@lucaswerkmeister.de>
 <20171105190451.16059-2-mail@lucaswerkmeister.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171105190451.16059-2-mail-rm2KDkFaiJZ2qFAiU50y3BvVK+yQ3ZXh@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Werkmeister <mail-rm2KDkFaiJZ2qFAiU50y3BvVK+yQ3ZXh@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Lucas,

On 11/05/2017 08:04 PM, Lucas Werkmeister wrote:
> Since the symbolic links for pipes and sockets do not refer to real
> files in the file system tree, it can be hard to discover that they
> still have mode and ownership information (revealed e.g. by `stat -L`),
> so let's point this out in the manpage.
> 
> ---
> 
> I’m not sure if this is too much text spent on a fairly rare problem –
> feel free to cut it down (or let me know that I should do so) :)

Seems okay to me. Patch applied. Thanks for this!

Cheers,

Michael


> ---
>  man5/proc.5 | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index 01be63417..14beedd11 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -684,6 +684,31 @@ the symbolic links in this directory is governed by a ptrace access mode
>  .B PTRACE_MODE_READ_FSCREDS
>  check; see
>  .BR ptrace (2).
> +.IP
> +Note that for file descriptors referring to inodes (pipes and sockets, see above),
> +those inodes still have permission bits and ownership information
> +distinct from those of the
> +.I /proc/[pid]/fd
> +entry,
> +and that the owner may differ from the user and group IDs of the process.
> +An unprivileged process may lack permissions to open them, as in this example:
> +.IP
> +.in +4n
> +.EX
> +.RB "$" " echo test | sudo -u nobody cat"
> +test
> +.RB "$" " echo test | sudo -u nobody cat /proc/self/fd/0"
> +cat: /proc/self/fd/0: Permission denied
> +.EE
> +.in
> +.IP
> +File descriptor 0 refers to the pipe created by the shell
> +and owned by that shell's user, which is not
> +.IR nobody ,
> +so
> +.B cat
> +does not have permission to create a new file descriptor to read from that inode,
> +even though it can still read from its existing file descriptor 0.
>  .TP
>  .IR /proc/[pid]/fdinfo/ " (since Linux 2.6.22)"
>  This is a subdirectory containing one entry for each file which the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
