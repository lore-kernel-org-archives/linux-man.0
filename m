Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0024F4C8C68
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 19:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672282; cv=none; b=CmzqIAEPVhWul0QTTLvv+YFqQVV6JHdqjnAfeEoSA7wy7+DnfaGZrAqXcwSZQeS+/wW0nNh3fr4gAguxXvGTidSuhqEFXhRZ6ah5wUjNAh7go2nWMsICCsdiZ5zCO6mLj+iUZD1cDaokJxayG+qaPKTR98+OOiUcF5q32O6KyNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672282; c=relaxed/simple;
	bh=sJb1J5ijTFV0S2Eap6vgcfobhB7cueDaJhLstemFM1U=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:Mime-Version:
	 References:In-Reply-To; b=oGRwabQBStIGKiZAAJ1/ADdX6nxD2qWYQQYExI/t5VZ60wLnGNm7tZoXupkMzX54SsTMtLLnII6P9kFNtoFmhJeF876gHi0S4dDOk2V1Xk2dJXj9lpBx65AwoWsk7hX706YhaFgjC93Y6x/vTKUk0HOj1Unz4qrERsY32AN+sr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net; spf=pass smtp.mailfrom=memeware.net; dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b=SeZ8IXhL; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=memeware.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b="SeZ8IXhL"
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=memeware.net; s=mail;
	t=1789672277; bh=sJb1J5ijTFV0S2Eap6vgcfobhB7cueDaJhLstemFM1U=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=SeZ8IXhLPhdqodq5cUx0XXI7pDBAE623muxxT0Zqtj4bCe+Tujkx0lGh2U6cPhtzD
	 1KIbq6mFAgtixzI8nLCy/kKgglomtbwx2Ve8sp2AYhJDgjeuvemFVK4Qzk2dbygwEo
	 ENls8+/W6EsEMk/EoCCYtYbDhok8PboGp/pKphId0iloesPuApSVDfP1IvxSKodWXy
	 1p18jSdLldryARyNXB09fQhHLda1RDULCZkmrzXrzg1PAjh6pFnFebx6jZ4a6ZBKQz
	 WDoEiwFathhuJnhc2FLPsG79nK1bxlIv2R8uV+bG2EyCdHCPxLjf1a0/bWd4P5nQJO
	 SG0wmbpJPbiRg==
Date: Thu, 17 Sep 2026 19:11:03 +0000
Message-Id: <DLHTVALF4BKZ.1F7TPFL1SE241@memeware.net>
To: "Alejandro Colomar" <alx@kernel.org>
Cc: "linux-man" <linux-man@vger.kernel.org>, <g.branden.robinson@gmail.com>
Subject: Re: [PATCH 2/2] man/man2/ioperm.2: wfix
From: "astian" <astian@memeware.net>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aqXOgqne-v4GtglY@devuan>
 <20260917062039.1365378-2-astian@memeware.net> <aqvVeSW_dHnYbwca@devuan>
In-Reply-To: <aqvVeSW_dHnYbwca@devuan>

On 17 Sep 2026 13:59 +0200, Alejandro Colomar wrote:
[...]
>> diff --git a/man/man2/ioperm.2 b/man/man2/ioperm.2
>> index e4a058164f6f..9b9aaf3840e2 100644
>> --- a/man/man2/ioperm.2
>> +++ b/man/man2/ioperm.2
>> @@ -4,7 +4,7 @@
>>  .\"
>>  .TH ioperm 2 (date) "Linux man-pages (unreleased)"
>>  .SH NAME
>> -ioperm \- set port input/output permissions
>> +ioperm \- set input/output port permissions
>
> If I'm understanding this proposal correctly, the fix is because I/O
> is an adjective of port, not of permissions.  And then 'I/O port' would
> be modifying permissions.
>
> If my interpretation is correct, then I believe I/O would be separated
> from 'port' by a hyphen, not a space.
>
> Is this the correct interpretation of the proposed fix?
>
> BTW, should we contract to I/O?
>
> 	ioperm \- set I/O-port permissions

Yes, grepping around I see all other pages use "I/O port", except for
proc_ioports(5) which contains "Input-Output port" in the body (and "I/O
port" in the title).

Leaving the hyphen out, per Robinson's explanation.
