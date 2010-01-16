From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 9/9] "null terminated" -> "null-terminated"
Date: Sun, 17 Jan 2010 08:02:52 +1300
Message-ID: <cfd18e0f1001161102r3ad26d50i6e846504a6c35995@mail.gmail.com>
References: <1263080737-2868-1-git-send-email-mfwitten@gmail.com>
	 <1263080737-2868-10-git-send-email-mfwitten@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1263080737-2868-10-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael

On Sun, Jan 10, 2010 at 12:45 PM, Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> The preferred spelling seems to be "null-terminated".

It's "NULL-terminated" when talking of pointers (e.g., the NULL at the
end of an array of pointers), but "null-terminated" when talking of
the '\0' at the end of a string. Most of existing uses are correct,
but I fixed fts.3 to follow these rules.

Thanks!

Michael

> =A0fts.3 =A0 =A0 =A0 =A0 =A0 : "NULL-" -> "null-"
> =A0getnetent.3 =A0 =A0 : "NULL-" -> "null-"
> =A0getprotoent.3 =A0 : "NULL-" -> "null-"
> =A0getrpcent.3 =A0 =A0 : "NULL-" -> "null-"
> =A0getservent.3 =A0 =A0: "NULL-" -> "null-"
> =A0getsubopt.3 =A0 =A0 : "NULL-" -> "null-"
> =A0putgrent.3 =A0 =A0 =A0: "NULL " -> "null-"
> =A0strcat.3 =A0 =A0 =A0 =A0: "null " -> "null-"
> =A0strcpy.3 =A0 =A0 =A0 =A0: "null " -> "null-"
> =A0console_ioctl.4 : "NULL " -> "null-"
>
> Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man3/fts.3 =A0 =A0 =A0 =A0 =A0 | =A0 =A08 ++++----
> =A0man3/getnetent.3 =A0 =A0 | =A0 =A02 +-
> =A0man3/getprotoent.3 =A0 | =A0 =A02 +-
> =A0man3/getrpcent.3 =A0 =A0 | =A0 =A02 +-
> =A0man3/getservent.3 =A0 =A0| =A0 =A02 +-
> =A0man3/getsubopt.3 =A0 =A0 | =A0 =A02 +-
> =A0man3/putgrent.3 =A0 =A0 =A0| =A0 =A02 +-
> =A0man3/strcat.3 =A0 =A0 =A0 =A0| =A0 =A04 ++--
> =A0man3/strcpy.3 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0man4/console_ioctl.4 | =A0 =A02 +-
> =A010 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/man3/fts.3 b/man3/fts.3
> index 7927544..e7fc193 100644
> --- a/man3/fts.3
> +++ b/man3/fts.3
> @@ -309,7 +309,7 @@ Upon return from the
> =A0.BR fts_children ()
> =A0function, the
> =A0.I fts_link
> -field points to the next structure in the NULL-terminated linked lis=
t of
> +field points to the next structure in the null-terminated linked lis=
t of
> =A0directory members.
> =A0Otherwise, the contents of the
> =A0.I fts_link
> @@ -344,7 +344,7 @@ Therefore, the
> =A0and
> =A0.I fts_accpath
> =A0fields are guaranteed to be
> -NULL-terminated
> +null-terminated
> =A0.I only
> =A0for the file most recently returned by
> =A0.BR fts_read ().
> @@ -362,7 +362,7 @@ are attempted.
> =A0The
> =A0.I fts_name
> =A0field is always
> -NULL-terminated.
> +null-terminated.
> =A0.SS fts_open()
> =A0The
> =A0.BR fts_open ()
> @@ -572,7 +572,7 @@ The
> =A0.BR fts_children ()
> =A0function returns a pointer to an
> =A0.I FTSENT
> -structure describing the first entry in a NULL-terminated linked lis=
t of
> +structure describing the first entry in a null-terminated linked lis=
t of
> =A0the files in the directory represented by the
> =A0.I FTSENT
> =A0structure most recently returned by
> diff --git a/man3/getnetent.3 b/man3/getnetent.3
> index 72b3efa..a6dbfa6 100644
> --- a/man3/getnetent.3
> +++ b/man3/getnetent.3
> @@ -100,7 +100,7 @@ The members of the \fInetent\fP structure are:
> =A0The official name of the network.
> =A0.TP
> =A0.I n_aliases
> -A NULL-terminated list of alternative names for the network.
> +A null-terminated list of alternative names for the network.
> =A0.TP
> =A0.I n_addrtype
> =A0The type of the network number; always
> diff --git a/man3/getprotoent.3 b/man3/getprotoent.3
> index 05c1d7c..2492983 100644
> --- a/man3/getprotoent.3
> +++ b/man3/getprotoent.3
> @@ -98,7 +98,7 @@ The members of the \fIprotoent\fP structure are:
> =A0The official name of the protocol.
> =A0.TP
> =A0.I p_aliases
> -A NULL-terminated list of alternative names for the protocol.
> +A null-terminated list of alternative names for the protocol.
> =A0.TP
> =A0.I p_proto
> =A0The protocol number.
> diff --git a/man3/getrpcent.3 b/man3/getrpcent.3
> index 8135c16..ee56f04 100644
> --- a/man3/getrpcent.3
> +++ b/man3/getrpcent.3
> @@ -46,7 +46,7 @@ The members of this structure are:
> =A0The name of the server for this RPC program.
> =A0.TP
> =A0.I r_aliases
> -A NULL-terminated list of alternate names for the RPC program.
> +A null-terminated list of alternate names for the RPC program.
> =A0.TP
> =A0.I r_number
> =A0The RPC program number for this service.
> diff --git a/man3/getservent.3 b/man3/getservent.3
> index 27df7af..b073ad7 100644
> --- a/man3/getservent.3
> +++ b/man3/getservent.3
> @@ -106,7 +106,7 @@ The members of the \fIservent\fP structure are:
> =A0The official name of the service.
> =A0.TP
> =A0.I s_aliases
> -A NULL-terminated list of alternative names for the service.
> +A null-terminated list of alternative names for the service.
> =A0.TP
> =A0.I s_port
> =A0The port number for the service given in network byte order.
> diff --git a/man3/getsubopt.3 b/man3/getsubopt.3
> index e4ffd59..49dff25 100644
> --- a/man3/getsubopt.3
> +++ b/man3/getsubopt.3
> @@ -51,7 +51,7 @@ that might be passed in
>
> =A0The
> =A0.I tokens
> -argument is a pointer to a NULL-terminated list of the tokens that
> +argument is a pointer to a null-terminated list of the tokens that
> =A0.BR getsubopt ()
> =A0will look for in
> =A0.IR optionp .
> diff --git a/man3/putgrent.3 b/man3/putgrent.3
> index 522716b..a33e3df 100644
> --- a/man3/putgrent.3
> +++ b/man3/putgrent.3
> @@ -18,7 +18,7 @@ function is the counterpart for
> =A0The function writes the content of the provided \fIstruct group\fP=
 into the
> =A0file pointed to by
> =A0.IR fp .
> -The list of group members must be NULL terminated or NULL initialize=
d.
> +The list of group members must be null-terminated or null-initialize=
d.
> =A0.sp
> =A0The \fIstruct group\fP is defined as follows:
> =A0.sp
> diff --git a/man3/strcat.3 b/man3/strcat.3
> index eed90ea..26f8025 100644
> --- a/man3/strcat.3
> +++ b/man3/strcat.3
> @@ -53,12 +53,12 @@ function is similar, except that
> =A0.IP * 3
> =A0it will use at most \fIn\fP characters from \fIsrc\fP; and
> =A0.IP *
> -\fIsrc\fP does not need to be null terminated if it contains
> +\fIsrc\fP does not need to be null-terminated if it contains
> =A0\fIn\fP or more characters.
> =A0.PP
> =A0As with
> =A0.BR strcat (),
> -the resulting string in \fIdest\fP is always null terminated.
> +the resulting string in \fIdest\fP is always null-terminated.
> =A0.PP
> =A0If \fIsrc\fP contains \fIn\fP or more characters,
> =A0.BR strncat ()
> diff --git a/man3/strcpy.3 b/man3/strcpy.3
> index 9d47e37..8adc2e9 100644
> --- a/man3/strcpy.3
> +++ b/man3/strcpy.3
> @@ -57,7 +57,7 @@ function is similar, except that at most
> =A0.BR Warning :
> =A0If there is no null byte
> =A0among the first \fIn\fP bytes of \fIsrc\fP,
> -the string placed in \fIdest\fP will not be null terminated.
> +the string placed in \fIdest\fP will not be null-terminated.
> =A0.PP
> =A0If the length of
> =A0.I src
> diff --git a/man4/console_ioctl.4 b/man4/console_ioctl.4
> index 57c2c0b..7808af3 100644
> --- a/man4/console_ioctl.4
> +++ b/man4/console_ioctl.4
> @@ -325,7 +325,7 @@ struct kbsentry {
> =A0.fi
> =A0.in
>
> -\fIkb_string\fP is set to the (NULL terminated) string corresponding=
 to
> +\fIkb_string\fP is set to the (null-terminated) string corresponding=
 to
> =A0the \fIkb_func\fPth function key action code.
> =A0.IP \fBKDSKBSENT\fP
> =A0Sets one function key string entry.
> --
> 1.6.6.102.gd6f8f
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
