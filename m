From: Dave Chinner <david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] fallocate.2: add FALLOC_FL_PUNCH_HOLE flag definition
Date: Mon, 19 Sep 2011 16:32:26 +1000
Message-ID: <20110919063226.GI15688@dastard>
References: <1289840876-3546-1-git-send-email-josef@redhat.com>
 <CAKgNAkj-jPR-9hyuxrJ74uu3Kdv9bATrfCUedoty4dJOCh2GcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkj-jPR-9hyuxrJ74uu3Kdv9bATrfCUedoty4dJOCh2GcA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Josef Bacik <josef-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Dave Chinner <dchinner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Sep 19, 2011 at 07:08:17AM +0200, Michael Kerrisk wrote:
> Hi Josef (Dave C, please also note comments below),
>=20
> On Mon, Nov 15, 2010 at 6:07 PM, Josef Bacik <josef-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote=
:
> > This patch adds the relevant documenation for using fallocate with =
the
> > FALLOC_FL_PUNCH_HOLE mode. =A0This information comes from the imple=
mentation of
> > FALLOC_FL_PUNCH_HOLE that I've posted along with this man page upda=
te to outline
> > the definition for hole punching. =A0Obviously this patch is depend=
ant upon the
> > current implementation being accepted. =A0Thanks,
> >
> > Signed-off-by: Josef Bacik <josef-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> > =A0man2/fallocate.2 | =A0 15 ++++++++++++---
> > =A01 files changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/man2/fallocate.2 b/man2/fallocate.2
> > index 42eefbd..1b28916 100644
> > --- a/man2/fallocate.2
> > +++ b/man2/fallocate.2
> > @@ -31,9 +31,8 @@ bytes.
> >
> > =A0The
> > =A0.I mode
> > -argument determines the operation to be performed on the given ran=
ge.
> > -Currently only one flag is supported for
> > -.IR mode :
> > +argument determines the operation to be performed on the given ran=
ge, the
> > +value can be one of the following:
> > =A0.TP
> > =A0.B FALLOC_FL_KEEP_SIZE
> > =A0This flag allocates and initializes to zero the disk space
> > @@ -50,6 +49,16 @@ the file size (as reported by
> > =A0.BR stat (2))
> > =A0even if it is less than
> > =A0.IR offset + len .
> > +.TP
> > +.B FALLOC_FL_PUNCH_HOLE
> > +This flag de-allocates the disk space within the range specified b=
y
> > +.I offset
> > +and
> > +.IR len .
> > +This call preserves the file size (as reported by
> > +.BR stat (2)),
> > +the only change will be to the amount of space used by the file. =A0=
After a
> > +successful call, subsequent reads from this range will return 0's.
> > =A0.\"
> > =A0.\" Note from Amit Arora:
> > =A0.\" There were few more flags which were discussed, but none of
> > --
> > 1.6.6.1
>=20
> Thanks for this patch. As noted in another mail, Lucian also sent a
> patch for FALLOC_FL_PUNCH_HOLE, and I applied his patch first, and
> then added some pieces from yours, as well as some of my own edits.
>=20
> However, the addition of a second class of operation to the man page
> made it clear that some significant restructuring of the page is
> required. So I substantially reworked the page, including the
> preexisting material on the default "file allocation" operation (Dave
> C please note).
>=20
> Josef, Lucian, could I ask you to check ("man -l <file>") the final
> text (below) for FALLOC_FL_PUNCH_HOLE (including the EPERM error unde=
r
> ERRORS)?
>=20
> Dave, could I ask you to review my reworked text for the "Allocating
> disk space" subsection?

Looks OK to me.

Cheers,

Dave.
--=20
Dave Chinner
david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
