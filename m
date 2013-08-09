From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Bug#553477: [PATCH] dir_colors.5: keywords SUID, SGID, STICKY,
 STICKY_OTHER_WRITABLE, OTHER_WRITABLE
Date: Fri, 09 Aug 2013 12:08:01 +0200
Message-ID: <5204BF81.6040400@gmail.com>
References: <1375748082-21280-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375748082-21280-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, 553477-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, debc <control-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

tags 553477 fixed-upstream
thanks

Simon, I have applied this patch, and also added the various synonyms that
the reporter, Stas, pointed out.

Cheers,

Michael

On 08/06/13 02:14, Simon Paillard wrote:
> See http://bugs.debian.org/553477
> See ls.c and dircolors.c in coreutils
> ---
>  man5/dir_colors.5 |   15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/man5/dir_colors.5 b/man5/dir_colors.5
> index b81dc4f..162c739 100644
> --- a/man5/dir_colors.5
> +++ b/man5/dir_colors.5
> @@ -149,6 +149,21 @@ Specifies the color used for a character device special file.
>  .B EXEC \fIcolor-sequence\fR
>  Specifies the color used for a file with the executable attribute set.
>  .TP
> +.B SUID \fIcolor-sequence\fR
> +Specifies the color used for a file with the set-user-ID attribute set.
> +.TP
> +.B SGID \fIcolor-sequence\fR
> +Specifies the color used for a file with the set-group-ID attribute set.
> +.TP
> +.B STICKY \fIcolor-sequence\fR
> +Specifies the color used for a directory with the sticky attribute set.
> +.TP
> +.B STICKY_OTHER_WRITABLE \fIcolor-sequence\fR
> +Specifies the color used for a other-writable directory with the executable attribute set.
> +.TP
> +.B OTHER_WRITABLE \fIcolor-sequence\fR
> +Specifies the color used for a other-writable directory without the executable attribute set.
> +.TP
>  .B LEFTCODE \fIcolor-sequence\fR
>  Specifies the
>  .I "left code"
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
