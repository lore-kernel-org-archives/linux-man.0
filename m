Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A9836B931
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 23:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785628422; cv=none; b=HO+LKkcDvSqYwspVE4RG6XsHXfrEuu7QcUh0zgyUcW5FAbIx40qdzw7nhxeIckXv8lWLNDucBN0PPCOYk/qG+jmZGxUeIDmP/RSupNebVvjGYZh+NfmyIAptfjLMEtxivEofy22PT7Q5PvhZZPGHeQFU7CJMUcBPK7mayPTaLJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785628422; c=relaxed/simple;
	bh=x7T6Tv17V3Uzn2wW3R4tBwr0J0OBCdhQHrlz4YD/9aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwRixRdeu6vrqISHda5LKIGnFsaB4TFaxmxx4f0Ij23FMrn6WTkrdRz/4rNl8a1zZojb81JcGAdtaeYrzFaRbpDDfABgdW+NRpnkv+kTA8Tefa0xSsKw1HDon654Jl8yfnOABnwiX8Pd76its2OyIgrzXO95doCO181oj7nNw5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxitmZoa; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxitmZoa"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-668296d0ff3so3053414d50.0
        for <linux-man@vger.kernel.org>; Sat, 01 Aug 2026 16:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785628416; x=1786233216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9bCVehCKzQbBTbsesFaKE3f1am1YIzxn7/y9NstLT4c=;
        b=sxitmZoauAbOThh+5lQGdl6JtEeCqeGjSycUQwCw656jOEOl0Bgj0zVJxra0gsJZIw
         s0ipMKNYBMz3c6O6PZ+o3nV1pX49oSvu2JRLLS8skvTz+Shbld1i+5SwLsAjsxCGOcey
         plQljUtOvtdPXBQC/I0pa3NnwpDLaYZ+sbfrdqOTJURVenYMtTZ6SDC/cLEjdRwzrDZA
         rdEupX6ziA1EC36fgyi0+6UCsAMkH10WzqvfGPSWbpiAQ44b1tReRJiENXXwu4fqVDS7
         iZDM2AquBKLC3D4YH0zgNPrbjsq0gcX2zeMPdCHaF1pbUvloO/NGUQn+HWG1Z8AHXdhr
         7rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785628416; x=1786233216;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bCVehCKzQbBTbsesFaKE3f1am1YIzxn7/y9NstLT4c=;
        b=VyUIYbKkXbYzQyj6CprUfJA+tf4iZiPVpXlboaSSINxD9XUCOA/Evrz4rJuyhJHKfv
         AixmyagbD6ZF2Wo04kG+8LaF0DIQsrRTf/9Uuit8Q74Lpz5jTDnb5NyD1Wli30q1oiUk
         0iXZad8jG3vwDnOIElI7YPC7D4iXqGDPSEr0jNmJ1SQzmLBUUVbqGa6sHDakli18GmYh
         YFAjcVVjn7xeEuI0sKmKCI0RQU2gBsiY3/FVARxzU8v3xWwd6LxQ7YyJa5gX+zNByLje
         DNl2iEE5/+pDdxLS032bhAjPXQt1ZVvz1Gi3EMyHl9hnzod5hREZv2aWInJkQbIZ4xK+
         odqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPOXjfdAWeakdSSfELnQ5gFRzsMDcm9bFUeYdejYvEGpqLR10WrUwRS456oITr+y+LccsaNndl4HU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzah988l9h0VxrJipdRZwR9pzCBbkPgGYWCpeSv+BdqyfbAxYbl
	edfGJf3BqHHzZN3NkfkvnsDmupIXcyqbG3wMcWXRJLKCl8YJV1tkt2PELi3x6lPj
X-Gm-Gg: AR+sD13trZ+80YbSmsS+iVWvcJHeqCJ87xDt0eaFXOiyQsXrSep6xfYATPpYggDKgK5
	nP/WvwxEXlUkLzmdjzSOCUi5tI4e3+luSz4MkBm2Y9Mv5YMx4SBzkguw3QlgzKv0ALT1azbMVIf
	+dGNH+uSfhbpx4BVpsAOholg+H7PakoS9fr5Py/wWX22WEwoCb61E5QeW3ZsX6NSSEr4Ya3pDPx
	31bAUbZ1mC5MoWM5PN0artFcfdXVHUX4/tHPw4b/SMmJGfL8yMmjYs26eA22yXZTagPSBl0+ldM
	Od2Vs0iaFtUcVGPXM3ao1/1yKBk/+ZlNW1oRmUT6sRMlb33uTh9m7moTc88DJ3eSMG+r75Epzfl
	rnSH/hUb74LcnVWpGLfSC5lE/XvPIRumhgTAjMgSC9QFrDoygq6/FZaNN0Jqb64lKGeYFbvZ6Pe
	PPl+4g35Ani8mDpADhYMRRiLMb6jCfuskCiIl3yVpkTLZiZMzwvQ==
X-Received: by 2002:a53:d012:0:b0:668:96a9:e50 with SMTP id 956f58d0204a3-6694f1cfe3fmr5208537d50.35.1785628416462;
        Sat, 01 Aug 2026 16:53:36 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948ff3b7csm3003585d50.14.2026.08.01.16.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 16:53:35 -0700 (PDT)
Date: Sat, 1 Aug 2026 18:53:32 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Keith Bostic <keith@bostic.com>, Sam James <sam@gentoo.org>,
	Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org,
	Mark Harris <mark.hsj@gmail.com>,
	Nevin Liber <nevin@cplusplusguy.com>,
	JeanHeyd Meneide <phdofthehouse@gmail.com>,
	Christopher Bazley <chris.bazley.wg14@gmail.com>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Iker Pedrosa <ipedrosa@redhat.com>,
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>,
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org,
	libc-alpha@sourceware.org,
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: proposed revision to memory.h(3head) (was: on the irresponsibility
 of pursuing C language reform)
Message-ID: <20260801235332.vc443gozbqkqdqm5@illithid>
References: <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w772junpj4b3wbyx"
Content-Disposition: inline
In-Reply-To: <am5_uA4MSujYCS9X@devuan>


--w772junpj4b3wbyx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: proposed revision to memory.h(3head) (was: on the irresponsibility
 of pursuing C language reform)
MIME-Version: 1.0

Hi Alex,

At 2026-08-02T01:24:28+0200, Alejandro Colomar wrote:
> > Date: 2026-08-02 00:44:46+0200
> > From: Alejandro Colomar <alx@kernel.org>
> >
> [...]
> > > Advocating for better usage in the documentation is a different
> > > thing, and a good thing. The man pages can even go pretty hard,
> > > that=E2=80=99s their job: =E2=80=9CNotice the include file is string.=
h. That=E2=80=99s an
> > > historic accident maintained for compatibility reasons; don=E2=80=99t=
 let
> > > that fool you, this function doesn=E2=80=99t operate on strings.=E2=
=80=9D
> >=20
> [...]
> > I should probably expand the NOTES a little bit, to be more clear
> > about why we ignore the standard in the SYNOPSIS.
>=20
> I've put that text in a centralized place, in the memory.h(3head)
> manual page:
>=20
> 	$ MANWIDTH=3D64 diffman-git HEAD
> 	--- HEAD^:man/man3head/memory.h.3
> 	+++ HEAD:man/man3head/memory.h.3
> 	@@ -10,6 +10,11 @@ SYNOPSIS
> 	      #include <memory.h>
> 	=20
> 	 DESCRIPTION
> 	+     These functions are also provided in <string.h>, as speci=E2=80=90
> 	+     fied by ISO C.  This is a historic accident maintained for
> 	+     compatibility reasons.  Don=E2=80=99t let that fool you; these
> 	+     functions don=E2=80=99t necessarily operate on strings.
> 	+

That's a heavy editorial slant.  I don't think it was a historical
accident; it was a historical "on purpose"[1], with which you disagree.
Here's a revision that goes a little less hard, favors active voice over
passive, and is shorter.

	+     ISO C mandates that <string.h> declare these functions.
	+     Be aware that they do not necessarily operate on strings.

> 	+STANDARDS
> 	+     BSD.

If you're tracking SVID in the Linux man-pages project, I would guess
that it was in the original SVID, which formalized/specified SVr2--but I
can't find online any version of SVID older than its Fourth Edition.

If you care about SVID, this point may bear further research.  Matt G.
of TUHS might have a line on older editions of SVID.

> 	+HISTORY
> 	+     The <memory.h> header file is the original one which was
> 	+     added in System V (1983), and was later adopted by 4.3BSD
> 	+     (1986).  It contained the original mem* functions.
> 	+
> 	+     C89 didn=E2=80=99t standardize this header file, and instead
> 	+     crammed all these functions in <string.h>, resulting in
> 	+     confusing programmers about the real purpose of these
> 	+     functions.

Again, you're going harder than you need to here.

I propose:

	+HISTORY
	+     System V (1983) introduced an initial set of mem*
	+     functions in a <memory.h> file.  4.3BSD (1986) adopted
	+     them.  C89 specified them in <string.h>.
	+
	+     The programmer bears the burden of selecting appropriate
	+     functions for operations on memory buffers (which may
	+     contain any bytes, including nulls) versus strings (which
	+     null bytes terminate).

If you like the foregoing, consider it:

Signed-off-by: G. Branden Robinson <g.branden.robinson@gmail.com>

Regards,
Branden

[1] As one does with "all the glue", when one doesn't want a "major
    award" to be readily repaired...

--w772junpj4b3wbyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpuhvUACgkQ0Z6cfXEm
bc7KbQ/8DCl6/657zY5rFy+cig8k13EpzQTQGIrAsPawN57sIuqH11eJqM+3U+tW
gSaj/YerGZXCfrZRC+CBdEvxBRZVTLsnPxB4ngKLU/6B+aWGmQSco3uIPbJdraZp
E47CUzJM3FwrYFvdQWotMa3okGrKz+QIguX/tXLRPU8f+zxIfQ7oowvG9l83xOCi
Ow7exYXcbacNmQBK6l9zx9igZWSZKb7hQVyZEoUOM98KpR/oHVvkNajkkajLQ5MO
Z3usDKscIo5MBJpdlcXvcvyc1tK5oha4Mkti3/2JXZg5iouBGOzeqzqG32PtwhAy
Um68SvYXWrKtmevHV3Q2ZuDhde2GsbO3uclwRYuVQUr8xzWO/qVaSbNK7Elt3zOt
e4cj9mtCgYtLKg65vt643YY4dnmkQQvBEgjQ+/0UfkfJVVU2xI00Yvx+TsouqJoj
PC+2Zshk4i2tARCD68q53W9N+L/CwJHYnBQBy0+tYiMm+xzTqOu2ZelGj19GjqxH
ukQZRjdVsRZNx6NqJ7WaQlSqUpMKcRVh+7QebGhtupUM1Qnrpgn5ycSInB6QR22V
Bclxg1NbreSuuyORo3Dy33JFCgjtqBHBEVVlu6NBcGGrK09kufVcGZq+ZO5j/6ss
HIBwh/MsJP6NNMIk6upiNmNd0Lv67MIiZhvzDX4w4XhMAYRujXU=
=QVZk
-----END PGP SIGNATURE-----

--w772junpj4b3wbyx--
