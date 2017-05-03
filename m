From: Stephan Bergmann <sbergman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] user_namespaces(7) userns_child_exec
Date: Wed, 3 May 2017 17:25:52 +0200
Message-ID: <e3c66e88-de0b-4fb6-fc8b-a050902fdc94@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-MW
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

[following instructions at 
<https://www.kernel.org/doc/man-pages/patches.html>:]

While toying around with the userns_child_exec example program on the 
user_namespaces(7) man page, I noticed two things:

* In the EXAMPLE section, we need to mount the new /proc before looking 
at /proc/$$/status, otherwise the latter will print information about 
the outer namespace's PID 1 (i.e., the real init).  So the two 
paragraphs need to be swapped.

* In the program source, make sure to close pipe_fd[0] in the child 
before exec'ing.

The below patch is against current git master 
(0708cba1d9072df6666ae2df949c24fbb87e3c11):

> diff --git a/man7/user_namespaces.7 b/man7/user_namespaces.7
> index a7a8924..2abfbe5 100644
> --- a/man7/user_namespaces.7
> +++ b/man7/user_namespaces.7
> @@ -971,21 +971,6 @@ bash$ \fBecho $$\fP
>  .fi
>  .in
>  
> -Inside the user namespace, the shell has user and group ID 0,
> -and a full set of permitted and effective capabilities:
> -
> -.in +4n
> -.nf
> -bash$ \fBcat /proc/$$/status | egrep '^[UG]id'\fP
> -Uid:   0       0       0       0
> -Gid:   0       0       0       0
> -bash$ \fBcat /proc/$$/status | egrep '^Cap(Prm|Inh|Eff)'\fP
> -CapInh:        0000000000000000
> -CapPrm:        0000001fffffffff
> -CapEff:        0000001fffffffff
> -.fi
> -.in
> -
>  Mounting a new
>  .I /proc
>  filesystem and listing all of the processes visible
> @@ -1001,6 +986,21 @@ bash$ \fBps ax\fP
>     22 pts/3    R+     0:00 ps ax
>  .fi
>  .in
> +
> +Inside the user namespace, the shell has user and group ID 0,
> +and a full set of permitted and effective capabilities:
> +
> +.in +4n
> +.nf
> +bash$ \fBcat /proc/$$/status | egrep '^[UG]id'\fP
> +Uid:   0       0       0       0
> +Gid:   0       0       0       0
> +bash$ \fBcat /proc/$$/status | egrep '^Cap(Prm|Inh|Eff)'\fP
> +CapInh:        0000000000000000
> +CapPrm:        0000001fffffffff
> +CapEff:        0000001fffffffff
> +.fi
> +.in
>  .SS Program source
>  \&
>  .nf
> @@ -1177,6 +1177,7 @@ childFunc(void *arg)
>                  "Failure in child: read from pipe returned != 0\\n");
>          exit(EXIT_FAILURE);
>      }
> +    close(args\->pipe_fd[0]);
>  
>      /* Execute a shell command */
>  
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
