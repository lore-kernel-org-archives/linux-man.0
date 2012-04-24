From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Tue, 24 Apr 2012 00:24:55 -0400
Message-ID: <201204240024.56967.vapier@gentoo.org>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org> <201204140036.28834.vapier@gentoo.org> <CAKgNAkjh46Bpar7qkJBn_r4D1qtFkbK_QLVfE3ESgEuaYMGp5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1443432.p8WSdIumsd";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjh46Bpar7qkJBn_r4D1qtFkbK_QLVfE3ESgEuaYMGp5g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1443432.p8WSdIumsd
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Saturday 14 April 2012 17:22:06 Michael Kerrisk (man-pages) wrote:
> The count arguments and
> .IR local_iov
> are checked before doing any transfers.
> If the counts are too big, or
> .I local_iov
> is invalid,
> or the addresses refer to regions that are inaccessible to the local
> process, none of the vectors will be processed
> and an error will be returned immediately.

to be clear, the arrays themselves are checked to see if they point to vali=
d=20
memory, as are the count values, before the transfer takes place.  so if=20
local_iov/remote_iov are NULL or similarly invalid, nothing happens.  in=20
practice, this generally equates to the same thing, but there is a slight e=
dge=20
case -- if the remote_iov array is mostly valid, but the remote count value=
=20
causes it to spill into invalid memory, nothing will be processed.  note th=
at=20
i'm talking about the storage of the elements themselves and not the memory=
=20
they point to.  but maybe being super pedantic here isn't necessary ...

> Note, however, that these system calls do not check the memory regions
> in the remote process until just before doing the read/write.
> Consequently, a partial read/write may result if one of the

any mention of a partial read/write should point to the text clarifying wha=
t=20
that means (perhaps something as simple as "see RETURN VALUE for more info".

> Does that not make better sense?

it does

> Perhaps I'm too clogged up with a cold, but I couldn't draw an answer
> to the question " does "a single iovec element" here apply to the
> remote iovec elements, the local iovec elements, or both?" from your
> reply.

wrt partial transfers, remote only afaict.  this is by virtue of nothing be=
ing=20
transferred at all if any of the local elements are invalid.
=2Dmike

--nextPart1443432.p8WSdIumsd
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPlisYAAoJEEFjO5/oN/WBHBgQANdFbAddKVA4Ix6v3Z0qdhX4
wGG2xjOsiW3ND34FU9uDwkLk131Hkmy8se6ZRveujSCbwaOhGZIdY9N8JJbiRaSJ
4QoUJTwuZI+8PwwtsycJKgnz7kPgRCFd8V8F3XutLLKL0omROHMgWs3RKiXR8H9k
KMPqnlFUNXFnfioZIfGQ6ae3a+v5rtH0KdqJACjfq1tV5SyjOCHkfMbC6ogoPXdz
CQn+fOs0XFyblWgMSIRGeYDSVAb2zuRt/PZ63iHe3JrvO4N7LXQw6BkOVTVbQQAW
NQXq6SFzEhfa2jxCau5qKTsznb91Y1nyBjNXSq7ipkcKQHYK+9ffA1izUjEREQCB
uymhQRJVfs/JQ8NK7SU31MjL3/AtW9CAp4VavojAGgq3FL3XrWLpsUKikqFztxH6
JSqtSBWvFTl6FDlMe1nwyASc3FDOER8FUfSqtFUU1tky/0zSFojXD2UEaXLDtifH
c+8NRHhd0ZaLP3X5VYJRkWlWUMucQMyt8ye6s8edYu/U2w4+C7dzJMwbNZM5H5iU
CjDD3e3N8syK+ZDIIQrtGlTqBrVn0rq/kz9JXj2l4dfzaMgl/xYRpZSaiqMTLUwa
BIeFiU7CfBi16HCFrO+WNSTHvgHXrpiPxyO8AwWoznB1ng5sybE8io2HnrTzffha
KY3umPn464eDsSfZIjtF
=nyf0
-----END PGP SIGNATURE-----

--nextPart1443432.p8WSdIumsd--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
