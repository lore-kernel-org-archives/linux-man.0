From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH] open: Document O_TMPFILE
Date: Thu, 8 Aug 2013 14:00:18 +0200
Message-ID: <CAKgNAkjE5tmeRJMMXpEc1mGz0pyPrt5PL5pkUjViunhtcC2W3A@mail.gmail.com>
References: <3bec865ec3205e23c997ddc2c9bbacf0e53b0d18.1375896634.git.luto@amacapital.net>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <3bec865ec3205e23c997ddc2c9bbacf0e53b0d18.1375896634.git.luto@amacapital.net>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Andy Lutomirski <luto@amacapital.net>
Cc: linux-man <linux-man@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@redhat.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

[CC list expanded a littlle]

Andy (et al.)

See comments below.

On Wed, Aug 7, 2013 at 7:31 PM, Andy Lutomirski <luto@amacapital.net> wrote:
> O_TMPFILE is new in Linux 3.11
>
> Signed-off-by: Andy Lutomirski <luto@amacapital.net>
> ---
>
> This may have formatting issues -- I'm terrible at groff.
>
> If the corresponding linkat patch makes it in, it would probably be
> worth documenting as well:
>
> https://git.kernel.org/cgit/linux/kernel/git/viro/vfs.git/commit/?h=for-linus&id=bb2314b47996491bbc5add73633905c3120b6268
>
>  man2/open.2 | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/man2/open.2 b/man2/open.2
> index ef0f664..8bf56a0 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -126,6 +126,7 @@ are
>  .BR O_EXCL ,
>  .BR O_NOCTTY ,
>  .BR O_NOFOLLOW ,
> +.BR O_TMPFILE ,
>  .BR O_TRUNC ,
>  and
>  .BR O_TTY_INIT .
> @@ -226,11 +227,15 @@ described in
>  specifies the permissions to use in case a new file is created.
>  This argument must be supplied when
>  .B O_CREAT
> +or
> +.B O_TMPFILE
>  is specified in
>  .IR flags ;
> -if
> +if neither
>  .B O_CREAT
> -is not specified, then
> +nor
> +.B O_TMPFILE
> +is specified, then
>  .I mode
>  is ignored.
>  The effective permissions are modified by
> @@ -284,6 +289,29 @@ The following symbolic constants are provided for
>  00001 others have execute permission
>  .RE
>  .TP
> +.BR O_TMPFILE " (Since Linux 3.11)"
> +Create an unnamed temporary file.  The pathname parameter specifies a
> +directory; an unnamed inode will be created in that directory's
> +filesystem.  Anything written to the resulting file will be lost when
> +the last fd is closed, unless the file is given a name.
> +.RS
> +.PP
> +.B O_TMPFILE
> +must be specified with one of
> +.B O_RDWR
> +or
> +.B O_WRONLY
> +and, optionally,
> +.B O_EXCL.
> +If O_EXCL is not specified, then
> +.BR linkat (2)
> +can be used to link the temporary file into the filesystem, making it
> +permanent.
> +.PP
> +The mode parameter determines the inode's mode, as with
> +.B O_CREAT.
> +.RE
> +.TP
>  .BR O_DIRECT " (Since Linux 2.4.10)"
>  Try to minimize cache effects of the I/O to and from this file.
>  In general this will degrade performance, but it is useful in

See my reply to the thread started by Christoph Hellwig
(https://lwn.net/Articles/562297/). I've taken your man-pages patch,
and applied it in a branch. I tweaked the language and formatting a
bit, and also added documentation of the EINVAL and EISDIR (ick!)
error cases.

As noted in the other thread, the API is questionable in the opinion
of a few people. Maybe it will change, and this man-pages patch will
need some further tweaking. If that doesn't happen, I'll merge it as
is, at the time of the 3.11 stable release.

Cheers,

Michael
