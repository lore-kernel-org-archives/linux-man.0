From: Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: manpage regarding shmat after deleting a segment
Date: Wed, 16 Dec 2015 18:57:07 +0100
Message-ID: <CAHO5Pa2NQSMkdqjQKmmC8h0zd5yPFzc=TpMe0S0C3bngcQU0fg@mail.gmail.com>
References: <20151012155021.GA3170@linux-uzut.site> <20151012161002.GB3170@linux-uzut.site>
 <20151012194329.GE3170@linux-uzut.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151012194329.GE3170@linux-uzut.site>
Sender: linux-kernel-owner@vger.kernel.org
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: Michael Kerrisk <mtk@man7.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Greg Thelen <gthelen@google.com>, Andrew Morton <akpm@linux-foundation.org>, Michael Kerrisk-manpages <mtk.manpages@gmail.com>, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hi David,

On Mon, Oct 12, 2015 at 9:43 PM, Davidlohr Bueso <dave@stgolabs.net> wrote:
> On Mon, 12 Oct 2015, Bueso wrote:
>>
>> At this point, the manpage should probably be updated to indicate that
>> this behavior is only as of v3.10.
>
>
> Something like this, perhaps?

Either I am misunderstanding you, or you're misunderstanding the man
page, I believe. The scenario I'm talking about is something like this

Process A              Process B

id = shmget(key, size, flags);
                       id = shmget(key, size, flags);
                       /* Or get the ID by some other means */
addr = shmat(id, addr, flags);
shmctl(id, IPC_RMID, 0);
                        addr = shmat(id, addr, flags);
                        /* Succeeds on Linux, but not on other systems */

I just tested this on a 3.19 kernel, and it still holds true. Have I
misunderstood your point?

Cheers,

Michael


> 8<----------------------------------------------------------------------
> From: Davidlohr Bueso <dave@stgolabs.net>
> Date: Mon, 12 Oct 2015 12:40:53 -0700
> Subject: [PATCH] shm: Document Linux policies for reusing removed segments
>
> With a399b29dfba (ipc,shm: fix shm_file deletion races) we
> changed the policy on how we deal with segments which are
> marked for deletion. This is an unintended consequence of
> the previous lockless ipc object lookup and security checks.
>
> Update the corresponding man-page to reflect this new behavior
>
> Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
> ---
>  man2/shmctl.2 |  6 ++++--
>  man2/shmop.2  | 10 ++++++----
>  2 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/man2/shmctl.2 b/man2/shmctl.2
> index 21ede49..6212aa4 100644
> --- a/man2/shmctl.2
> +++ b/man2/shmctl.2
> @@ -405,13 +405,15 @@ In the future, these may modified or moved to a
>  .I /proc
>  filesystem interface.
>  -Linux permits a process to attach
> +Until version 3.9, Linux permits a process to attach
>  .RB ( shmat (2))
>  a shared memory segment that has already been marked for deletion
>  using
>  .IR shmctl(IPC_RMID) .
>  This feature is not available on other UNIX implementations;
> -portable applications should avoid relying on it.
> +portable applications should avoid relying on it. As of version
> +3.10, -EIDRM will be returned in these scenarios, and therefore
> +attaching to a deleted segment is considered forbidden.
>   Various fields in a \fIstruct shmid_ds\fP were typed as
>  .I short
> diff --git a/man2/shmop.2 b/man2/shmop.2
> index e818796..1ea6f99 100644
> --- a/man2/shmop.2
> +++ b/man2/shmop.2
> @@ -266,10 +266,12 @@ Therefore, any pointers maintained within the shared
> memory must be
>  made relative (typically to the starting address of the segment),
>  rather than absolute.
>  .PP
> -On Linux, it is possible to attach a shared memory segment even if it
> -is already marked to be deleted.
> -However, POSIX.1 does not specify this behavior and
> -many other implementations do not support it.
> +Up until version 3.9 On Linux, it is possible to attach a shared
> +memory segment even if it is already marked to be deleted. However,
> +POSIX.1 does not specify this behavior and many other implementations
> +do not support it. As of version 3.10, -EIDRM will be returned in
> +these scenarios, and therefore attaching to a deleted segment is
> +considered forbidden.
>  .LP
>  The following system parameter affects
>  .BR shmat ():
> --
> 2.1.4
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/



-- 
Michael Kerrisk Linux man-pages maintainer;
http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface", http://blog.man7.org/
