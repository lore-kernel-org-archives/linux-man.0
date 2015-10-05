From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch] posix_fallocate.3: Mention glibc emulation caveats.
Date: Mon, 05 Oct 2015 10:06:14 +0100
Message-ID: <56123D86.9050601@gmail.com>
References: <560E0567.7040204@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-63660-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <560E0567.7040204@redhat.com>
To: Carlos O'Donell <carlos@redhat.com>
Cc: mtk.manpages@gmail.com, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

Hi Carlos,

On 10/02/2015 05:17 AM, Carlos O'Donell wrote:
> Michael,
> 
> You're going to really enjoy reading this patch ;-)

Thanks for the patch. What a sad story :-{

> Patch applies to master.
> 
> When the glibc implementation of posix_fallocate detects
> that the underlying filesystem does not support fallocate
> it uses an emulation function to attempt to allocate the
> space requested. The most common case is calling
> posix_fallocate for a file that is on NFS where the
> NFS server is not new enough to support the recent fallocate
> extensions. This emulation has various serious caveats that
> must be understood in order to use posix_fallocate robustly
> on all filesystems. The change document the caveats in the
> glibc implementation.
> 
> Lastly, we expand the meaning of EINVAL to match POSIX
> 2013 (Issue 7). If the underlying filesystem doesn't support
> posix_fallocate the implementation can return EINVAL, but
> glibc does not do this, it emulates the operation instead.

Thanks. I've applied. I tweaked the wording a bit in a further
commit, and then made a further commit where I tried to fine tune
the  technical details a little. Could you please check commit
624fbe44d9c1ef54eb3fd36328f59a5037b87986 and let me know if there
ia any technical misstep there?

Thanks,

Michael

> Signed-off-by: Carlos O'Donell <carlos@redhat.com>
> 
> diff --git a/man3/posix_fallocate.3 b/man3/posix_fallocate.3
> index e35dcb9..1b91a37 100644
> --- a/man3/posix_fallocate.3
> +++ b/man3/posix_fallocate.3
> @@ -83,7 +83,8 @@ exceeds the maximum file size.
>  .I offset
>  was less than 0, or
>  .I len
> -was less than or equal to 0.
> +was less than or equal to 0, or the underlying filesystem does not
> +support the operation.
>  .TP
>  .B ENODEV
>  .I fd
> @@ -142,6 +143,30 @@ In the glibc implementation,
>  .BR posix_fallocate ()
>  is implemented using
>  .BR fallocate (2).
> +If the underlying filesystem does not support the
> +.BR fallocate (2)
> +syscall then the operation is emulated with the following caveats:
> +.IP * 2
> +The emulation is inefficient.
> +.IP *
> +There is a race condition where concurrent writes from another thread or
> +process could be overwritten with null bytes.
> +.IP *
> +There is a race condition where concurrent file size increase by
> +another thread or process could result in a file whose size is smaller
> +than expected.
> +.IP *
> +If fd has been opened with the O_APPEND or O_WRONLY flags the function
> +will fail with
> +.B EBADF.
> +.PP
> +In general the emulation is not MT-safe. On Linux, applications may use
> +.BR fallocate (2)
> +if they cannot work around the emulation caveats. In general this is
> +only recommended if the application plans to terminate the operation if
> +.B EOPNOTSUPP
> +is returned, otherwise the application itself will need to implement an
> +fallback with all the same problems as the emulation provided by glibc.
>  .SH SEE ALSO
>  .BR fallocate (1),
>  .BR fallocate (2),
> ---
> 
> Cheers,
> Carlos.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
