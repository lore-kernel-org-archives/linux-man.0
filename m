Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792799829;
	b=LC+8okleKAfQIlvULfkhOpiUTo65UskAQpx1Ai8OgLY0C7F5caN9Q05bKqo2aGbZfrAD
	 2+3NSZdUFt7gWLonIL1piK/66V++T1CHR+PHpJjSNUd7YOyc35YbcsrrsHFeCM0jcLh1C
	 hjokNc9zF8bYXQxA1d6bofZl4T/C+1iuvPQ2FMMrDqcQqEuaFnv0b5cY+bbLgHTGc3FXz
	 QmIIZYyB4nN7L8HqnigPupTPcxORDaFnCZqZ6Vf4CvIaBXG/jc07DHgfMAsTcnmDMWemJ
	 27P3aXClXbz0DF/lvSMNAvnHyRCPx81EM2N0JP6dHlZfUjQHkNBhClZmGV7OyTshctg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 Mime-Version:Subject:From:In-Reply-To:Date:Cc:Message-Id:References:
	 To:X-Mailer;
	bh=ewF8np0cdFf9QOJVLcsIJsVGpOVBiFnxB8OOVWJgHPo=;
	b=IcVaMVd38qDhc3BD2xCGmWW5DCIZSsxujJMx9MfS4mqgLQ8u0vnfpiCtidhpzRX8n8Zw
	 Aniodsh21JlRzkqGKLWxo/v8mtsJFgXkQBtboE+Fcz/a8J/keDKYgwtJSbnGiKngSATcS
	 XEWBKXuJ1f0bqsslzy/XHIzRCxQR1Eoxe547/R5klJnaNoLeTInZ1KWhoyF6F1dCYicJ/
	 /SNrWQHMmb27lCoL5QyyNgyBZPyNkzXeuZ+MQj5wt8LA+kY05GSzar5VIZp3aTiy9GEvm
	 1Y95rZzxGdIK+2wl987Ioj4zLhaWvEUuKUEB40YgIPTIAp91g28hcnXVKInFxGqkgqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iLhArgCc;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4419F606A334
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 23:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4419F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iLhArgCc
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9d1114320so10242955ad.3
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 16:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792799828; x=1793404628; darn=vger.kernel.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ewF8np0cdFf9QOJVLcsIJsVGpOVBiFnxB8OOVWJgHPo=;
        b=iLhArgCcZIUqtQMwX1DFWR9u226FzdIYQFwzhzLKV4y4inkBx3ukgLS0rtpR/cUsZg
         cNLmPHQbO9oG2UDNWMTqpMmHL4Jk0J3r1ArP80Xe0R2+fULOreoyTzfOG9c5HTyGQrw+
         oFOaMGycl/cUyShpP2LM+K7+RsLWxUmBApEeHg7LdNGSizgIIGpLsREw+y78cqf0yhQm
         /0ns9UlULyMME13eViARw6XwYEg+QoBSHiKuC/4J27qwe63LgmmX8WFYmt713c7oRGUb
         B9M6Xcti/XcVSX4iNvLYyxjWtA5A3AZa2Lax+ka4jYUDHx3iigdmyXHykoOms6GTxFk2
         FRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792799828; x=1793404628;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ewF8np0cdFf9QOJVLcsIJsVGpOVBiFnxB8OOVWJgHPo=;
        b=ZkTC2wdCdBPdwk9wMuWCFHVjaEMrBEeKs0zJykXO+4L4D6VSCxNlJ5PFRZCiXeWpBB
         8UzGoP/TxIN5+jK6LUKK++l5fQvkm9YJLmtVjIuGb49wbb6txEPTsFvOGWy2t/FQ1vaI
         GtMTEOqFHtCRB9CKt/jkSMhgP6TjaTTo7x1QMe9A5lfMXptCzhEOSc4W+yP814PEcPW5
         xOazBPVZme7kwg0FeLVmj97lsR4ynK57lp3CYmLrfXsNsuK/qsZnqBYGNpnUPNruvryl
         /MIpXe6QiZvlsL1H0ZQCOR8RyeuAA5tpA77f0Xch3fYL0fjXSHKtQqjRny4HQsBd+OMc
         uemQ==
X-Gm-Message-State: AFq9FYIjDn8kAR5DMKg49SeHjBshldukZmN43Mr1kMGR/X63oYu2m0O2
	Z3Xhv65Rsr9vf9yd7s0XPFtxXkyLMzDWo512moM99hm+v01PSHhIpPX7VLbnum+jTAU=
X-Gm-Gg: AYBFou2YpKpkCgPwOJjxPKe92EdFNi5EjF4tUCroBa40bUKtB4O1XXxyQCYCe2DqApN
	xQFszBeKaIgi13QpOkYy3Q4y9B7dg5wUamlijZYztU9qA8uR1JgWsyG8s7IdLLFIESiR+sIsvdr
	jK4Wt+zmba3rHTYJFOXmXzs8YdDZhE/xuxf8yE4V3ux8oNnFFUqZd+XHSb1/k+oKCE/YxLFV8Y1
	QWP7APH3XIyen+mn+6ZHbg43SZ8YVBemepGepKwj6I14jhdJn2iVqmvBkZumLClACFn8zGh904L
	oeIOik2z+8HcWb6u5dTsP05kCICDoJfwPNRMxPMDxWWe4+SIf8JYcvBlTjDB0IvyAJJTch1Q+Ek
	UVskse2+N+GpOgL7XbviED9DgFFILccZofz7NTRuFmoosyp3Ad0vPIwbYoaghp3YWT78rVAUyOT
	o9YPOiLHXYf1UoUVdeEi0dH1DdBxfxlXuO9RevI4+5wpT2f1ZO0K7PZKPs0dO68JVCTq/8ftJaZ
	GcWnComoYGRo+IPA3OrXm8gXZZPh1Q2XmdtRI1ohhTdaFpiC3M6Vn2/M/8bPmc67RczH2uT+j+T
	WsrHyA0GfNv0GrrXDE8H9Yiu
X-Received: by 2002:a17:902:c94d:b0:2e9:6333:fbb7 with SMTP id d9443c01a7336-2ea9c810218mr4771625ad.51.1792799828402;
        Fri, 23 Oct 2026 16:57:08 -0700 (PDT)
Received: from smtpclient.apple ([187.15.154.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1214a3sm1541345ad.21.2026.10.23.16.57.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 16:57:07 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_65789254-CFBF-4CAD-8565-A1D900366014";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH] man/man2/sched_setattr.2: update `EINVAL` case with
 `.sched_flags`
From: "Enji Cooper (yaneurabeya)" <yaneurabeya@gmail.com>
In-Reply-To: <atu28R9-CdAtoz-V@debian>
Date: Fri, 23 Oct 2026 16:56:51 -0700
Cc: linux-man@vger.kernel.org
Message-Id: <737C7FD6-E204-4C90-B811-26BEECE7D7FC@gmail.com>
References: <A89056FB-15B8-454D-9C6F-9EEB75965302@gmail.com>
 <atu28R9-CdAtoz-V@debian>
To: Alejandro Colomar <alx+linux-man@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.3)


--Apple-Mail=_65789254-CFBF-4CAD-8565-A1D900366014
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Alex!

> On Oct 23, 2026, at 12:37=E2=80=AFPM, Alejandro Colomar =
<alx+linux-man@kernel.org> wrote:
>=20
> Hi Enji,
>=20
>> Date: 2026-10-23 11:58:57-0700
>> From: "Enji Cooper (yaneurabeya)" <yaneurabeya@gmail.com>
>>=20
>> In more recent versions of the kernel, `.sched_flags` is a treated as =
a
>> bitmask that supports values like `SCHED_FLAG_UTIL_CLAMP_MIN`, etc.
>>=20
>> Account for the additional flags so the documentation is up to date =
with
>> the kernel implementation of `sched_setattr`.
>>=20
>> Ref: linux.git 480a6ca2dc6e ("sched/uclamp: Allow to reset a task =
uclamp constraint value")
>>=20
>> Signed-off-by: Enji Cooper <yaneurabeya@gmail.com>
>> ---
>> man/man2/sched_setattr.2 | 5 ++++-
>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/man/man2/sched_setattr.2 b/man/man2/sched_setattr.2
>> index 80a0ac726dcf..64acdd88884f 100644
>> --- a/man/man2/sched_setattr.2
>> +++ b/man/man2/sched_setattr.2
>> @@ -417,7 +417,10 @@ .SH ERRORS
>> .B EINVAL
>> .I attr.sched_flags
>> contains a flag other than
>> -.BR SCHED_FLAG_RESET_ON_FORK .
>> +.BR SCHED_FLAG_RESET_ON_FORK ,
>> +.BR SCHED_FLAG_UTIL_CLAMP_MIN ,
>> +or
>> +.BR SCHED_FLAG_UTIL_CLAMP_MAX .
>=20
> Why does this list not include flags such as SCHED_FLAG_RESET_ON_FORK?
> It is documented in the same manual page, so I expect it's valid here,
> right?

I actually added the `SCHED_FLAG_UTIL_CLAMP_MIN` and =
`SCHED_FLAG_UTIL_CLAMP_MAX` flags to the list of valid flags, in =
addition to `SCHED_FLAG_RESET_ON_FORK`.

I=E2=80=99m kind of on the the fence with how I worded it though =E2=80=94=
 it=E2=80=99s kind of wordy and not really futureproof. I=E2=80=99ll =
take a look at some of the other manpages to see if there=E2=80=99s a =
better way to word it.

Cheers!
-Enji=

--Apple-Mail=_65789254-CFBF-4CAD-8565-A1D900366014
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkHfexGRJ3gYRdA2gGpE5DjPsNJgFAmrb9EMACgkQGpE5DjPs
NJi1vA//Vfnecm4P39Xx9vYBElchpqpGhZdjf8uyY97/wKGCfAzeqM1XeHhlbpk/
XCJfRSLKBOjY6MDPuakoiRZjVn/WPM5zsB/v0OVryjBtnz00rjb86Avdx3hZdV44
+YC0vhXRLeKQExPlNL/hOTvwSl3Np62AgO4WLMa+3D5o+4Y+aGFb5JJbFvorGJYo
uK2uoGBo8Wnf8G+KYTadKF+cuHCi2FK9EsCx+9pzgyEaWvccndQ3fkh3RXqgkkKv
khanVkIIs+Eo7Phj3uXhDwZ9tM9Gv8LzEnHTuopbFkFqw3k9QAb4PrzWCvZF82UW
oX7dJJQ+enPS52YRRCPI420RalJVrhUxM0rHRh+3SKGsFECRtWi4lo9U1gXHtDvk
JPFz6jqOO8rinNZYwkJ7TAKwRMSJMRzhh+xRlhuUdqatg4Ihvs9OxXcvcsACgn5K
ldVqwnnV7xaDgZbfrjCd6AacpNUYIO99dGZOyXYzWVx0Dy9vIAMeeRfdvLD0HzyW
dg7dNEvpbd2MzmgvdFKWnp8zJFXizoQNhRNB/ByB6EQI/repS+NJi5dIxFBoj+73
BUSFvHQzV7XyKpk0tFnjLVbGaDMJrgwhpmGWeZ1QhTdPrcoZcC0Nd60CnAx3QLp6
KSoKdQ1xQoR/NX46fKZT+OuNslNo0UfsrdWDqELBfPZrPrgTjLE=
=jVBS
-----END PGP SIGNATURE-----

--Apple-Mail=_65789254-CFBF-4CAD-8565-A1D900366014--
