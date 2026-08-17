Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B33369D6D
	for <linux-man@vger.kernel.org>; Mon, 17 Aug 2026 21:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001201; cv=none; b=SS35TccVk6j9yH8TlVEPfVAORBzIHVJs68cmvDeed6KRP2Yk/cfBtSqUFhP4JwpbmPBi/MxYMniWsqTyiG3lVQTZ5UGjeJPWzulyOJ375ayjOcRgv7+AgABdZ2rTLV0GiVtUIyuWRM3KtqJcDRZAzg/tnI+Sj2Vz7jMOD8/oIjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001201; c=relaxed/simple;
	bh=T/2nBbVa8M9nK1ex0cVqhLdVeOrZcWHeGsr9+RgHM7c=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=OAfWleKLQssCBX4BX+Zhi5fH5wMoAB8qa+qyzFtj82lmuOLMptKJpdQ/pVjJL16LgRe3c6hh9DFufgMzta5t+pASXjPldZsfGTxFbb6x+J7OlAZbcinwGbxkuyFXVfh3H6u+GIB4fylyKS3/NUmJSiriUu2aGiVi5ZT+1lZYOmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=WJHVBpdW; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="WJHVBpdW"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 67HLCnhr2090432
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 17 Aug 2026 14:12:49 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 67HLCnhr2090432
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026072801; t=1787001170;
	bh=GHm388Fhrpq/OiDR1TkHBE5AFaBQEQvxyNy0hU0wYg8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=WJHVBpdW+2L2FHDD0VHQ9hT573y0nfdSjMmVEUG5wSjF+G+OPlsreevigaNOM7QAE
	 QetHiNuR/NKLsKzOiTIrTqhaneK1p7jdV1DgpWpMNwuMPgKiTznPLsNA8EcsALir1j
	 fCZlPzcgFSX+RC2/WBPUZIFW4wCjFKKyP1wye1xcks7gl7zf6MN24vwAtkY2WnCh8p
	 rtba4xSff2rE0pVJkWknkkNi9cJYZsjuKEomDyJagJH++81KWsVMOP5SjZFXmjwiQz
	 by3AOZyqXMhx0yF0XRsCZWRYsltlKABzDf4sA3PUMoLZI70McRLAjoNimO4SlOmK7J
	 yor/6rUELwyGA==
Date: Mon, 17 Aug 2026 14:12:44 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Alejandro Colomar <alx@kernel.org>
CC: =?ISO-8859-1?Q?Pali_Roh=E1r?= <pali@kernel.org>,
        Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
        Guillem Jover <guillem@debian.org>, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org
Subject: Re: On <asm/termbits.h> and <asm/termios.h> usage in man pages
User-Agent: K-9 Mail for Android
In-Reply-To: <aoLY9Oko02NzSsuV@debian>
References: <aoGk8FSBlwYAmvu8@thunder.hadrons.org> <20260816121505.jyz3ynrb3rxlvq6h@pali> <61b8b3f7-9c33-4704-a0ba-29e77a5e3cba@linaro.org> <20260816131955.lbuwrp32eyq4rt4b@pali> <83BA7F0B-7318-4F8B-B59B-1F508750E276@zytor.com> <aoLOL-1JRTElewuP@debian> <919B6782-3170-4A69-8431-1576526CA33A@zytor.com> <aoLY9Oko02NzSsuV@debian>
Message-ID: <A09427A1-AD92-41CE-B0E7-C7D97C401AF0@zytor.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 17, 2026 2:53:09 AM PDT, Alejandro Colomar <alx@kernel=2Eorg> wro=
te:
>Hi H=2E Peter,
>
>> Date: 2026-08-17 02:23:39-0700
>> From: "H=2E Peter Anvin" <hpa@zytor=2Ecom>
>>
>[=2E=2E=2E]
>> >So, any suggested changes to the manual pages?
>> >
>> >
>> >Have a lovely day!
>> >Alex
>> >
>>=20
>> Didn't we talk about this about two months ago?
>
>Yes, I pushed an extensive set of changes to the manual pages, splitting
>termios(3) into many small pages=2E
>
>I'm now waiting for your patches to the smaller pages=2E  I've replied to
>that old thread too=2E
>
>
>Cheers,
>Alex
>
>>=20
>

Ah, ok=2E

Things have been a bit insane here because of an unexpected event=2E=2E=2E

<https://m=2Efacebook=2Ecom/story=2Ephp?story_fbid=3Dpfbid02XCTWizxhQ8Efou=
xWt1TDnUPjM6HEZFwe2hVxreFa7gkVi1hhNWm4uvEaVDVhzrm6l&id=3D740261238&mibextid=
=3DNif5oz>
