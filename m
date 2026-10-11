Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CA13939AE
	for <linux-man@vger.kernel.org>; Sun, 11 Oct 2026 20:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791750355; cv=none; b=JMhVU4w+hUqToMnI2koXiRFDug/dqtAykWyeMkVrX24IkJEuZZoVRsJ/lSP4p8JMrX0KkzJ9sPCavrirp9vNtKhrQfdMos6T8H8gFAhak/KpsWM/zgNgMNBhEVs4d6sz8j6Kr3EhZk3PsI++aw6v3QB/vJw5B6J+F+At9e+4+Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791750355; c=relaxed/simple;
	bh=VfHJJsV32cjCAg7TUoG03rIOBnRkUtaOnvBW7T2cjfk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=fbTQpUxOIQ2HYGHmR5NxrEAnvd42J4DXUaPkJqGjtOCMmdcY5XRMyu+HU/yERpTY9KK13FDopBF3UNMeeKlnKTiPcRPlz/D35ObLMuQLOXKxxhraMYdGKkyiSaM9AOTQdUiWRnPFR/9YprzxVVJ4EUcdbjPlBbUCkILHMudsfAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net; spf=pass smtp.mailfrom=memeware.net; dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b=Bj9aKjOZ; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=memeware.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b="Bj9aKjOZ"
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=memeware.net; s=mail;
	t=1791750339; bh=VfHJJsV32cjCAg7TUoG03rIOBnRkUtaOnvBW7T2cjfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bj9aKjOZdO9ktTuWpOhNdSCAFcNG3Gw+yD3TDKhpZB5fgqtzQXqdjftdyNaa2HKOb
	 S/8l7gcuW3HGKP8sxiGSJqM451ec3+ytp7CPZtBmJtMxbPGl84CzZOXMwBP9yHjDzv
	 X7eTRbfBWZFzZu8wdX/rMJ+ngyUJx7xWCz4ayfcWajvQEsn7ixV6diS2XWKi1nn6ht
	 yuEQtRNJhye+ll8H43yQo6lGhOcqDd6/fxSOFgwidI3jOllmFsO7sM3Mr9tR0Pn9YE
	 r/IDzWPAGv34KzHSLwEJ4XvVlfsFllx4uWXREczXJuBuDlsovq6xtKGJuN/cYDxNko
	 /lyH2+aYAoHpw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Oct 2026 20:25:14 +0000
Message-Id: <DM2AH5960WGS.3MF3NZDFF3XL5@memeware.net>
From: "astian" <astian@memeware.net>
To: "Alejandro Colomar" <alx@kernel.org>
Cc: "linux-man" <linux-man@vger.kernel.org>
Subject: Re: [PATCH v2] man/man2/ioperm.2: wfix
References: <20260917062039.1365378-2-astian@memeware.net>
 <20260917195740.1380709-1-astian@memeware.net> <asvDZz1YFHM_Leg3@debian>
 <asvDg4Aix4UNOin6@debian>
In-Reply-To: <asvDg4Aix4UNOin6@debian>

On 11 Oct 2026 19:13 +0200, Alejandro Colomar wrote:
>> Date: 2026-10-11 19:12:28+0200
>> From: Alejandro Colomar <alx@kernel.org>
>>
>> Hi astian,
>>
>> > Date: 2026-09-17 19:57:28+0000
>> > From: astian <astian@memeware.net>
>> >
>> > Signed-off-by: astian <astian@memeware.net>
>> > ---
>>
>> Thanks!  I've applied the patch.
>
> I think I've applied everything from you.  If there's anything else
> pending, please let me know.

Nope, you're right.  Thanks.
