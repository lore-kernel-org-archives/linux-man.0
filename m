Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792820830;
	b=x/NQUeCa/kUzQYUSOuz9Cff6yGxfkRjLs6q063xLbinj3l5GrczFfo5mqx1C1Fy8C1ZN
	 5PDQr15I+xIPBakiA11HJYcFOijtvl8T4iuuQiCB9g82CG9d3dGYvHL/sojqdIzFJ9JGi
	 w9R2+cm5YSMVEFLshDtxrRikd+dui+1tPsTLytD/6+YsFNzQ1X8u9JGjzd4QxiMB4svT9
	 JWbpzir3Lg9OR3iCxFbUWonx2avbHt4IvZuub/loQUuijMY+wo0MrFGAysVXoKMQZPlzs
	 rCVnT1IBg4NUBKtv3fzWLHo7SxE+Ry5+TjDdod3nTbsVPQshLGRPDx/NEo2kvf86idg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792820830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=nPcp5Nsw9Q0kRW31wIwFt3RN+XtCDgB55xqE22uquFo=;
	b=RxNzPFe2LC8pp1rFoC2vHrWzp8itGdgmujxYwtBgBADTmsT+oJpOmuvFhXLNExi+y7rj
	 AwAE965nBANpYAyKjxPlOSIj9RlNOf6eP6A3AsRtv5bDEBJznSkov1sj6AR1YiTx6oyuf
	 SfT63GvsTUxIfkUJudfy/zHhaN3GLwDx4Y8JKZKzEDOZGJG82eJcirABW4qHRgt1Y0SDY
	 CWk2VpetBak+EaTHI5pGo2Qn2iMaPhQJ+2tHENECCIPayAsjU7S0+weHjEhR4c1Z2Ge58
	 1CoIChbmpXOYjq240LUeJowUp1hvF8u/s2c/oa0kXEcD1d0top882kjEvHbSFfeQoyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=pn7l931v;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEA8606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 05:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EEA8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=pn7l931v
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so1602566a91.0
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 22:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792820829; x=1793425629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nPcp5Nsw9Q0kRW31wIwFt3RN+XtCDgB55xqE22uquFo=;
        b=pn7l931vQ6Kod0x/Jfr1V6qpwULcbu91lfQKnQwU67cbKR0gVp/LQdOjEhhm3shJV4
         7DvnoY2YRcvx/2AV4R4v/HrGFnVkXpy2b4jd6ojJPP3eIh0c4ScBrsU4uRhBddisRnqh
         T73LhmA5Jc96Emvla9pV7YsXu2dIXOFVcGDDSFUB5nb4+MCA/s/STaINQH+IQozKGb2O
         a/x0q+GxGWMBGqaoa7fDFmF6JVEYmV1RTQwIFtcF/mZ43Pe5kg6qdFuXsY5pYekLRiI1
         cYlX7bdQ60/KkB8xs9TO8xTEFeZVaIfDNJT4zERqUyu/CuUKPWAi1Ff0G/EXhIie1L79
         dE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792820829; x=1793425629;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nPcp5Nsw9Q0kRW31wIwFt3RN+XtCDgB55xqE22uquFo=;
        b=XLOqAWCA3PBBCTxsAXMtoVZhVp/RatgwQM1Whtt5v4hvgpNW1kjfR0TdCP+50sr1mc
         V2boUI6ObR7tlvoEmS/5/JUJNrn9dN12LTwiboo7TxruizmVbFv9kxvLjqcp5fKSBeDZ
         5ulrTWUTJb6SzxxXrvV2KWlZpdZtaqh/rd6+5ABem+Z1OqpNGkSke/LjrKAwtFurHFEF
         CoIb3xTvy1xkSeqeD6uYZm3YswnzOtDbBBmnj+NKZ6C3nQNoJW23OuyyJ8+V0tdJ2FPm
         iJ7Qlz+IknhOkfPyxofMxnCH2NNCK9aKD7ddsPGLbi8qD2SmLW9nN+u9KaU+RtaxSRbj
         0Q5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwNMmCY4zKNvCDlnJ8CckatpF/HT090i3Ijvr2adYbSf73UdTR7sq1eXlrUpuPDLLhsj72waBIN7Nc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7XkLMFlke8ZUfCWlMe7M2++22ekVKOdFECj11bYcWmzm2sD27
	5ryAPphY6rieNYgsLSOnTPBaoOZ9AyIQOsyfssDtL3PXVmxwUWqb6b4GtehF1SeoZANkFzM/rPV
	pITOAnA==
X-Received: from pjst21.prod.google.com ([2002:a17:90b:195:b0:3ab:3d7f:6c0c])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2ecc:b0:3ab:c80:936f
 with SMTP id 98e67ed59e1d1-3adea896292mr989059a91.16.1792820829478; Fri, 23
 Oct 2026 22:47:09 -0700 (PDT)
Date: Sat, 24 Oct 2026 05:47:09 +0000
In-Reply-To: <20261021210800.27338-8-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021210800.27338-2-gnoack3000@gmail.com> <20261021210800.27338-8-gnoack3000@gmail.com>
Message-ID: <atxF6ghHu45qq9dU@google.com>
Subject: Re: [PATCH 6/8] man/man7/unix.7: ERRORS: EPROTONOSUPPORT: Protocol 0
 is also accepted
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Oct 2026 23:07:58 +0200, G=C3=BCnther Noack wrote:
> unix_create() in linux.git net/unix/af_unix.c starts with this check:
>=20
> 	if (protocol && protocol !=3D PF_UNIX)
>         	return -EPROTONOSUPPORT;
>=20
> Therefore, not only AF_UNIX (a.k.a. PF_UNIX) is accepted as a protocol
> value in the unix(7) socket(2) invocation, but also 0.  0 is the usual
> value, and is also given as example in the SYNOPSIS at the top of
> unix(7).

For the same reason with the previous patch, please drop this change.

It's not worth documenting.


>=20
> Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---
>=20
> Notes:
>     I double checked it in the code.
>=20
>  man/man7/unix.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 29843235def0..054f1af75dd5 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -729,7 +729,7 @@ or
>  .BR sendmsg (2).
>  .TP
>  .B EPROTONOSUPPORT
> -Passed protocol is not
> +Passed protocol is neither 0 nor
>  .BR AF_UNIX .
>  .TP
>  .B EPROTOTYPE
> --=20
> 2.56.0
>=20
