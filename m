Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B2C4519A0
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 07:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628712; cv=none; b=AWCpMTu96GSylvdOxweUEfE3280n+Qy+gqpob1tVA5G/c8e3O33QaqsSOx420yXGmYBae3nVs8wfracUSbUFQZewNlwQyTlSoifh+JRj1wv29JZI+B/dPrfAYlRm2AGffe2J0camTlP6yH1XKsC3YYreuf1sJMLyXpQwRyzhSpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628712; c=relaxed/simple;
	bh=f5gWUU29bCigqq5/HY1xazwdaBxIQ0Of+aytU+8CRLs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=iVfBv6SvFA5D+ixyLyMut0i/Vpf2ZJd/QF4uyfspzxg23xCyeiAT0nZvvwQ9XIFOxPTzpm8Zjk3oEYa7y74guT4YG3OnJpv6kiE2aXxdHDwYP6BmoVEc1ueG6aj5Pwaq482UgyNXqtlad5dqmUAj5gGh/Z1goKKyKwtjQi4UhpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net; spf=pass smtp.mailfrom=memeware.net; dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b=YkmcClUs; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=memeware.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b="YkmcClUs"
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=memeware.net; s=mail;
	t=1789628698; bh=f5gWUU29bCigqq5/HY1xazwdaBxIQ0Of+aytU+8CRLs=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=YkmcClUs++8DSa+8lUCi9aBShlLHs6AJK1b3OZESX5R2oJwICOOGRX8D2jUguouNV
	 5Kxjt7TnaLYZSbKKx4fZkW1+/CxlM/A+OPZZgmvPvFVcRBTLMAejEnr7DlmVuHDJFx
	 n62N8QZxEvMKmfsP53EKD6gUxdwz9qv8iB7ELHveb4fJwFwuwvUYTHiF/wj9Z6ILqw
	 O6zElct6JcSJUH5K3x04psSrMIX6NIuILo3yySfMQWkEdv4XZgBfNFPR68eJvGMiic
	 gDzlcFHEwuvqJ5S2FEZznykbKp7B5FvWmGt3oWBl1opkxbguaLEShBAeCIIrUQuL0L
	 Mm22dvj/WUrHw==
Date: Thu, 17 Sep 2026 07:04:37 +0000
Message-Id: <DLHEF3KZF52V.2PBZHFYF7KPYO@memeware.net>
Cc: "linux-man" <linux-man@vger.kernel.org>
Subject: Re: ioperm(2): confusing terminology
From: "astian" <astian@memeware.net>
To: "Alejandro Colomar" <alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
 <aqXOgqne-v4GtglY@devuan> <DLDZ6A0QS5NY.E0Y1TPNME1IN@memeware.net>
 <aqfsMbQWdqq_TG_b@devuan>
In-Reply-To: <aqfsMbQWdqq_TG_b@devuan>

On 14 Sep 2026 14:56 +0200, Alejandro Colomar wrote:
[...]
>> Which bring up the question, why not moving to a less hairy source
>> format?
>
> This question comes up every now and then.  TL;DR: other formats are
> worse.
>
> man(7) is pretty simple, and easy to learn exactly by editing words
> blindly.  There are very few macros, and their behavior is trivial once
> you use them a few times.
>
> One thing that is very important is that we use semantic newlines.
> That discards .md and .rst, since they are meant to be written with
> paragraphs as they'd be read by humans.

Sorry, I didn't read groff_man fully, but I'm curious: what is the
meaning of newlines in man that gets lost in those other formats?
Looking at some source pages now and it seems most newlines are about as
(non) meaningful as in those formats (i.e., the paragraph is reflowed
during rendering).

> mdoc(7) is more complex than
> man(7), and thus we don't want that.  There are other formats, also
> inappropriate, for the same or other reasons.
>
> A summary that will serve for 95%+ of the text written in manual pages:
>
> 		.SH section heading
> 		.SS sub section
> 		.B bold
> 		.I italics
>
> 	Alternating per word (spaces removed):
> 		.BI bold italics
> 		.IB italics bold
> 		.BR bold roman
> 		.RB roman bold
> 		.IR italics roman
> 		.RI roman italics
> 	(roman means normal)
>
> 	paragraph separator:
> 		.P
> 	Indented paragraph:
> 		.IP
> 	Tagged paragraph:
> 		.TP
> 		tag
>
> 	Examples:
> 		.EX
> 		this is an example (monospace, no fill)
> 		.EE

Thanks for the synopsis.
