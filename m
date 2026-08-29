Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2141175A5
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 04:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787978182; cv=none; b=cplKPikn/4nJBYz6PQPIqdtDqttuEi88Z/9pplcTJwIPJb3w8XVj7yxLnBCIOsJCSwarRnG6uCbaAoayjUHMy0Z34+5V9r160ZRHoHdk6XbCCqctieKyDnT0cmiAc8wV2WEe1uoKv2PGYYFoYcUiE76cgRSZVtaFXTHCCq6Z8MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787978182; c=relaxed/simple;
	bh=YTW03jTEAlcn0QPRRBjzmVm8y4qQrMmSEtQN5qKTzTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BniZXtpXd6oLkmvI6xzdvHZhhkqXY92KqGIYOF2M7vdMB0HXccEEAaL8dTBNzD9vpoJUpu0TvxpUGqOzVzMCIvqIAmelA6RwSFRrWwwE77RLspIlS5pQzRLE3sSgXe/Z41nrsJKSC87PpPVuQ0D9JwhgF8TsG9BAnX6hWszw8+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJuiUV1t; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJuiUV1t"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66c4e9769bdso2175949d50.0
        for <linux-man@vger.kernel.org>; Fri, 28 Aug 2026 21:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787978180; x=1788582980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ug0kMDI9CmzHwotcglYja2PAhea6vwdJuNSEesjfHzY=;
        b=GJuiUV1tBrB3oT1lxsnpdHKioKUZ7hO1I43OG2N4gK2ZKTsRUTS+f1RoBU6zMdOp0W
         dHjXM8WxJh8rUh+W3nWt49xD4i2d93X6E7mVY+FpBMDatpZe9wDqur0M5vmyNNUsC8hi
         q1fpqc58BXIE5Xf6cZAecl268iy8sA9rG5arKHOwxm43qyUFtCKRQ1NWvl8DcxDrFYY3
         n8JfsrD49/kenCtlzLSrtPfOQs5uU8pHRUnzdnOYHJB7XSwSdnP6zB/LPu6c+DoSeRam
         JZ4jAsonOWR/G05zZK0p0DJ3igBwmuGrjendBM+mtxUf3cVCmLFSU9sC/4Hm6DeLejgU
         +ODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787978180; x=1788582980;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ug0kMDI9CmzHwotcglYja2PAhea6vwdJuNSEesjfHzY=;
        b=mvc4lvJDAbJ2akvy1/3DnASYCFPL4hxnUh2Swu34qMlGom2jyyTxk2cS1iFfhP2Iev
         d/EGOqHI/N9loyFYSqJ60EJl4hf8iHnBLNBQcJ34dhqZpJe7/cAYsLYsMy6Cj4hBH1j4
         lutcN5mSyt8iT/r129tbIkZuokmmry9f66oUCOOVbeKoAZosM3beXjePaMMnloeSvgyn
         vdIsw3VbO6ttQPCL7RH63QrMpNKW3E30BkHHKULg9Qjs4/1zsFXTcOQBlEeK7Pxr4bhd
         aO0f8XECMudDP/PnJGvdZMzZbdKtJSbIcTBzQcFctkNv6z+DHCR7zTFSpozLlyjYdZjs
         fyNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfrWognq2VA/RVE1XO7yOrTQn3cFzRH6FKlTvE/P345foBbEwa0kSWQwn5+nuebzLy3OfL32LL8Yw=@vger.kernel.org
X-Gm-Message-State: AFuF++mvSQvUc9K304j+a1BVw0Y+qbF68lvcz7lxE+PpoFRZRpdke+hP
	SP87o8y5Knam2c5dgpeDy2gncpA6DLWsdVLg4xqWezmCyR7djOq5QaVY
X-Gm-Gg: AYBFou1GpGZA0GmxmmYgLDBCaM9/LHbg01LotJKjToGONZVAsQ8J9BtOrsMcZFb6XUz
	DUeEjmgsBLhpso78a3CsS4Zgtr+kq3OWBGYsJTCPgk5aKQpH+L357d0LGa6ch6uuIhJJs48qx1N
	2UBJZFmipR1YsKqtqZc7vBm84QxUv77mWROueoGRYVw12dMr6L2wNpG6iepN7soa5CUItguOVJf
	44B1NkJSn0fzSayfIw6F/wjSQ9AGmQhsujNzjlqxPi5I0/40B4g8/Gs0cqA+MEAbg/iFmLf0Uuj
	fAo+ZfW1wZQk/ApEUKSQCGZdKa+KWhsdXQTLj27T+ysymviJt/JskbqDOm3Wj/0zYv+GeTb1Cfe
	RczvMapaMrLSfQHuwN/5nN8YvXK5GwQ9j3d8+zxLXm6mLgVogw3E9+Sif5RuQ4WF+iEnikYVdG+
	coa8pGi9qmPlUZUXxISUtZUM8FQI2FnmVVzpMKmFvXgL7wY1vSHg==
X-Received: by 2002:a05:690e:d85:b0:66e:56bc:e5ee with SMTP id 956f58d0204a3-66e56bce9a5mr1499794d50.4.1787978179714;
        Fri, 28 Aug 2026 21:36:19 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ed163bcsm2035223d50.16.2026.08.28.21.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 21:36:18 -0700 (PDT)
Date: Fri, 28 Aug 2026 23:36:15 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Ingo Schwarze <schwarze@usta.de>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	groff@gnu.org
Subject: Re: Using LS/LE
Message-ID: <20260829043615.vuh3idp3a7if4vnm@illithid>
References: <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <aot0q9iCIXOJf8Kk@isnote.usta.de>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wrk7bia33i63soje"
Content-Disposition: inline
In-Reply-To: <aot0q9iCIXOJf8Kk@isnote.usta.de>


--wrk7bia33i63soje
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Using LS/LE
MIME-Version: 1.0

Hi Ingo,

At 2026-08-24T00:31:07+0200, Ingo Schwarze wrote:
> I don't yet understand what the point of .LS is

I have articulated clearly several specific points about it.  I
initially had the idea for LS/LE as early as December 2022.

https://lists.gnu.org/archive/html/groff/2022-12/msg00075.html

At that time, I got no feedback on my proposal, which I interpreted as
indifference.  That's the usual fate of my proposals.  ;-)

For example:
https://lists.gnu.org/archive/html/groff/2026-07/msg00096.html

Earlier this year, after list nesting caused Alex pain again, and having
gotten more familiar with the bash(1) man page source, I consulted with
Alex, P=C3=A1draig Brady (GNU coreutils), Stephen Gildea (help2man), and Ch=
et
Ramey (GNU Bash) regarding its interface, semantics, and goals.

> - in my experience, assembling items from .IP and .TP blocks to form
> lists is *not* among the problems the man(7) language causes - quite
> to the contrary,

Assembling a list is not difficult.   Exercising control over
indentation and inter-paragraph spacing (even just to turn it on and
shut it off) as they apply to the items of lists, especially when
nested, can get quite tedious.

> even though HTML is a strongly structural and semantic language,
> assembling even HTML code from .IP and .TP is a almost never a
> problem, and i don't see which other target format could possibly
> be harder to handle than HTML.

I don't disagree there.  To get groff man(7) to generate <ol>, <ul>, and
<dl> elements as desired, I'm going to have to make other revisions to
grohtml(1) first, because it insists on using HTML tables to mock up
indentation.[1]  I don't want that.  So unfortunately I don't expect
that improvement to element tagging in HTML output in groff 1.25, though
I hope to get that done for 1.26.  (All the other features of LS/LE are,
and Alex just this week helped ensure that some bugs in it got stomped.)

That's not really HTML's fault, but arises from groff's long tradition
of swinging a Mario mallet to force its stream-based paradigmatic
processing peg into HTML's block-structured hole.

> I would probably have to read up on prior discussions, but the topic
> feels unrelated and i won't mix it into this mail.

groff's documentation attempts to motivate the macros' presence.

groff_man(7):
   List enclosure macros
     Enclose paragraphing macros between LS and LE to identify them as
     list items.  Doing so can mark them as =E2=80=9Ccompact=E2=80=9D, ease=
 management
     of their indentation, and supply hints to the output driver to
     improve their rendering (as with HTML).  Lists can be nested.
     (Sub)sectioning macro calls, and the end of the document, close all
     open lists.  These macros are GNU extensions.

     .LS type [compactness [indentation]]
            (since groff 1.25) Start (or open) a list.  type is one of
            =E2=80=9Cdefinition=E2=80=9D, =E2=80=9Cenumerated=E2=80=9D, or =
=E2=80=9Citemized=E2=80=9D.  compactness is a
            Boolean value directing suppression of inter=E2=80=90paragraph
            spacing between list items.  indentation specifies an
            indentation amount for the body of each list item; it is
            then unnecessary to specify this argument to the list item
            macros.  Use IP with a mark argument to represent an
            itemized or enumerated list item, and TP for a definition
            list item.  Use IP without arguments to associate
            successive paragraphs with an existing list item; to these,
            inter=E2=80=90paragraph spacing applies even in compact lists.

     .LE    (since groff 1.25) End (or close) the most recent open list.

NEWS:

*  The an (man) package offers new macros to ease the formatting of
   lists.  Enclose paragraphing macros between `LS` and `LE` to identify
   them as list items.  Doing so can mark them as "compact", ease
   management of their indentation, and supply hints to the output
   driver to improve their rendering (as with HTML).  Lists can be
   nested.  (Sub)sectioning macro calls, and the end of the document,
   close all open lists.  See groff_man(7) for details, and
   groff_man_style(7) for an example.  Thanks to Alex Colomar, Chet
   Ramey, P=C3=A1draig Brady, and Stephen Gildea for consultation and
   encouragement, and to Alex for selecting these macros' names.

   Because these macros format no text, documents employing them risk no
   damage to their content if the formatter does not support them.  A
   man(7) document author can choose either to transition to these
   macros, to manage list "compactness" and item indentation with
   existing man(7) package facilities, or to employ both approaches.

Regards,
Branden

[1] https://savannah.gnu.org/bugs/?68424

--wrk7bia33i63soje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmqSYbcACgkQ0Z6cfXEm
bc4qzg/9Gc47qfyW2GP4Wuew20DhOILFv3g8VmjVdtwdTA4xgctKfrFWHupa6sp6
YUWzJ9lGYwkWF8BJ1vttaTS4wxXj2g19lGAjybSBL9WvgXWqN2SWw9tqPH6vY6Ui
E5jzQShgGrdpxYiMZTQQ1+Orz6tBPaLqWSwuxh/dGap8dW+/LUsJck1WkPkSJrNY
ER4Gr5D+LG+Cmw/QDo9gYkFTPwrsgh9GJPlF8bvqEGril8sBnXsczHQt7QvMaMQa
FnmiBLBET+fu9TM6MoVGtUTcfxvlGeAPWH0UVvMf46yVcM5Bx4ovQlzTjxy0pEhu
izU0Btgqa48Mp6sUI1Kxu4i8yI/wgMLjqj842lEYUGb2EAV+kKxf4FkODnwQl+bJ
vTn0jn473lphWnv9XegfKhJWUCGfbAxTceLmvnlTR8UK92sA2cKTMvB2kmwwA0Bn
qtkZbbIj5DztAipT+u35iDI2y8a07L8Ycp+VWnehx7+dUXxX6IMMcx7bXqi1c/Yy
10g9NJnS4rnRalmqKWIQx+8+K3H5Y8CVXWzf5Qer/pxPoj8xtTTMOAuD5G18Xdv/
2dckmXKAS6B3MVJgbKUJfx/+AhiTzJokVxpbnSuV8R963/wFxWtt8DwhG+NVAJwe
zywfUnwjhAsDTjAcMzYMRqEXcEP1wtcjgz08ATWaC2WTnE6nJ0o=
=3eyr
-----END PGP SIGNATURE-----

--wrk7bia33i63soje--
