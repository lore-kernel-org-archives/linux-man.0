From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: connect.2, ioprio_set.2, ...: tfix
Date: Mon, 23 Oct 2017 06:43:28 +0200
Message-ID: <c23c4934-9310-d8fb-a51f-cf894513431d@gmail.com>
References: <20171022100452.vexn5fvln5cdjhoh@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171022100452.vexn5fvln5cdjhoh-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/22/2017 12:04 PM, G. Branden Robinson wrote:
> Fix nonstandard usage.

(Well, nonstandard from an American POV. But, American is the baseline
for man-pages.)

Thanks, Branden. Applied.

Cheers,

Michael



> diff --git a/man2/connect.2 b/man2/connect.2
> index e7d35f4d6..d55d69bec 100644
> --- a/man2/connect.2
> +++ b/man2/connect.2
> @@ -179,7 +179,7 @@ been completed.
>   is not a valid open file descriptor.
>   .TP
>   .B ECONNREFUSED
> -No-one listening on the remote address.
> +No one listening on the remote address.
>   .TP
>   .B EFAULT
>   The socket structure address is outside the user's address space.
> diff --git a/man2/ioprio_set.2 b/man2/ioprio_set.2
> index 0e86d6ca3..6e53687b4 100644
> --- a/man2/ioprio_set.2
> +++ b/man2/ioprio_set.2
> @@ -314,7 +314,7 @@ Priority levels range from 0 (highest) to 7 (lowest).
>   .BR IOPRIO_CLASS_IDLE " (3)"
>   This is the idle scheduling class.
>   Processes running at this level get I/O
> -time only when no-one else needs the disk.
> +time only when no one else needs the disk.
>   The idle class has no class data.
>   Attention is required when assigning this priority class to a process,
>   since it may become starved if higher priority processes are
> diff --git a/man3/dbopen.3 b/man3/dbopen.3
> index f48658fb6..d76ee3e6a 100644
> --- a/man3/dbopen.3
> +++ b/man3/dbopen.3
> @@ -544,7 +544,7 @@ for any of the errors specified for the library routine
>   The typedef
>   .I DBT
>   is a mnemonic for "data base thang", and was used
> -because no-one could think of a reasonable name that wasn't already used.
> +because no one could think of a reasonable name that wasn't already used.
>   .PP
>   The file descriptor interface is a kludge and will be deleted in a
>   future version of the interface.
> diff --git a/man5/group.5 b/man5/group.5
> index 704ba48fd..0475764da 100644
> --- a/man5/group.5
> +++ b/man5/group.5
> @@ -57,7 +57,7 @@ a list of the usernames that are members of this group, separated by commas.
>   .SH BUGS
>   As the 4.2BSD
>   .BR initgroups (3)
> -man page says: no-one seems to keep
> +man page says: no one seems to keep
>   .I /etc/group
>   up-to-date.
>   .SH SEE ALSO
> diff --git a/man7/fifo.7 b/man7/fifo.7
> index aa73f9dd6..b17eb9f66 100644
> --- a/man7/fifo.7
> +++ b/man7/fifo.7
> @@ -34,7 +34,7 @@ until the other end is opened also.
>   .PP
>   A process can open a FIFO in nonblocking mode.
>   In this
> -case, opening for read-only succeeds even if no-one has
> +case, opening for read-only succeeds even if no one has
>   opened on the write side yet and opening for write-only
>   fails with
>   .B ENXIO
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
