Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049345;
	b=LImaIxDkLerYjk/zfOPBJ0TU3RX+WeGyadUE996CpUjO/PxH+E9WYz8JxAIKLrJHH0Ta
	 q0P91FnYZ3mQVjPWSIcP0dLoEbR7UdyPwaqGHtkFaXLUbMq0rL79cUEQSS1R8inTyFNhK
	 aJaBiqbmerpiNcuJvJci5fFuDtukTCKWjzqrPkzANFEvTyUjZmzSiADKTu0KkDzcYhRfk
	 6/BOeMwD3DSctuNzJdfC4Kh0Edk7TvVvITFYntUI+hKIcsYNrPR5uTc/ksfaFXGtrJzhQ
	 kPkbT+1SUqtq33iAAcWOPzJOAq2Z/Z8t5QalcSAdfcFrxBe6KcsOQZutQL81pEqIzHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=goNO1vZCKSvEIu4c1h06xIjEbV7l4XZD+p345HzoFa0=;
	b=r8zjFGhryVvv5RKncOry8+k7j133dW+pR2QeCOUrCG2eqZ5LXHfRiRmrAimdyZXa7HzQ
	 t5xwctky656sHmn/BwtpAtSI5gmBxCb+ZscwQLEs9NvlLUQtQteaWPJ6xDlFqYcfIDkrm
	 Y47yqMZQyFIQqviQvk5TTcSetc8RJ5p5QP+a1ovLuTF6JjYn6yjJA/2cOfdFFLrQuF9rP
	 /jaItOcxqjXtnbTxcFftFPYGE8kEWe4g2DuMu6Qj2BObMg5U+Tzq2NpnbrxazBip4PueE
	 RqOiG5W/cI9iZjEWc56QhxzeBbH6QVjjfV4n9dtD+TWidDuGQeStdXeg16ZH8VuF2DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhp6jGNw;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42405606A31A
	for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 21:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42405606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhp6jGNw
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so12309335e9.3
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 14:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793049344; x=1793654144; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=goNO1vZCKSvEIu4c1h06xIjEbV7l4XZD+p345HzoFa0=;
        b=qhp6jGNwK5FKEwdVnkYLmwzV9+tXVMEcWn5Gi9WU6njTg1CYcffdJjOmivLNSs5Ujz
         jXORcpl3IMUek1TENC9EvcvS1Y6GwPjpDUvsf3I0l9cbtZp4mfDqDkSTIfXr3Y6aAPh/
         DTbsglLXP718idEQUPp8uJ05qJOVHCDpRHQB+Qe0SZe+26ehRWFd4TmV1JJz0eaYI7QN
         kRN084OqAuMD+u/mnEvB9vKoB59DdWK3e91uH8RZoXpTv/16OMAplbCRK37wMdZOApB4
         0SQIgUJSKbgKBqnbt9G9/6y6U78QWg1j2HQoeagNlRmBAdYjlbzdrGRPxqdzvj21r/Ey
         23Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049344; x=1793654144;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=goNO1vZCKSvEIu4c1h06xIjEbV7l4XZD+p345HzoFa0=;
        b=umRkJi0U+baGPww4no3xHKkQ/lDzVkwpwTlZBxQUE4XTXsoOE1A/BRMNV579CeLEGX
         4fTHee68FyXLvAbi1q2Eowrq7A4dt0/CCBLPAik72NHMCBT23NHofQ4Z06SS/Fly2S/7
         7kYdpcAazg1g3hRMiG7At2pHewB2A/kwGjX3UJJZgRmtaGphhoFBJ3spKcM4SDzxb0qE
         pPBXYT8koDfMqAPszd+tyJxwEsJPTpfHLJgpLizYKWod5Jxf6+wW5Fy5k9L1BqermESr
         OMyGdK0SjjV78ihwSA7YK6zHBhUjnn7OVCCCcwJhD/0JG2z0PMnAU2svw8LMkRdOkJZs
         FCUw==
X-Forwarded-Encrypted: i=1; AKwUvBzVKvCDYpRWwP97piiH/+Yu0WCZ1i27j9TG+fnb2y7z64/KkR0m6q8keaAO1HSSTPVK+u8V2+6O3V8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCWtRJW8/DRIG+CQISDH6z0Ats1MfUJHfRAqctuKMEVnB1CpCU
	RfdQTa7Tc0Eky1DAEdx0Rz54VAZINf2ffYSlpzhnBXRCVs3ESFIKVnqo
X-Gm-Gg: AYBFou3kpxIJaozUJ/0IK77/b3N7tmG1dIh0rTqt5FUJEn5gxceoPkaMSwTpa9gVdiL
	FotTkyGSbzFPbxW6Itk0A0qZ4cH9L52WIBlGO9+r5yoMxPQuUsVRwEX34HJK+Qf/JUELOjaZrqD
	/6gnYY9CxefiKXdHdHi7e4lxRezV3iZO+DmMhc59sALQJE8dEw+s/na/nY7mKAOcYDXY4SV2DPO
	/lHxmI8Xc8JtaKHnMiCuOILlTu54fdEsa3TiRZqI0w2I4LBZwsHEcCnyBfQKoPXALFCTBIYDVU6
	mcQZAR5TDIAXfvuCDgn8rNsbTlt9DcRYSLC9uhBfnmyaTLXtDwsKJKkvOrpRScC/JK/meTfUpK8
	5XuHYD5obM+JZvrV1R+RGUdgPm4YzSwaw3O8tJYHWH1HywMq0qbLqm1H75tAzUMuGWyDH96Ux5X
	0kXWt55IvbEhapp7afB9Al3QNqHzNLT6F4SaVNmvxOcvIxhLfKqGrjlElH7HehewUiwp92Rygp3
	oeQ1jmvdiYX8Hh7b1Vbo8pRcKtKnHwnCuWQNf14Dmnzfg7AS1qr3M7kI051iUtRgQf6Oqq6uS1B
	15ON
X-Received: by 2002:a05:600c:3b02:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4a35ac8e71emr151339365e9.14.1793049343523;
        Mon, 26 Oct 2026 14:15:43 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35b4a8bc1sm103084855e9.4.2026.10.26.14.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:15:43 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:15:27 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH 6/8] man/man7/unix.7: ERRORS: EPROTONOSUPPORT: Protocol 0
 is also accepted
Message-ID: <20261026.1854bd192793@gnoack.org>
References: <20261021210800.27338-2-gnoack3000@gmail.com>
 <20261021210800.27338-8-gnoack3000@gmail.com>
 <atxF6ghHu45qq9dU@google.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atxF6ghHu45qq9dU@google.com>

On Sat, Oct 24, 2026 at 05:47:09AM +0000, Kuniyuki Iwashima wrote:
> On Wed, 21 Oct 2026 23:07:58 +0200, Günther Noack wrote:
> > unix_create() in linux.git net/unix/af_unix.c starts with this check:
> > 
> > 	if (protocol && protocol != PF_UNIX)
> >         	return -EPROTONOSUPPORT;
> > 
> > Therefore, not only AF_UNIX (a.k.a. PF_UNIX) is accepted as a protocol
> > value in the unix(7) socket(2) invocation, but also 0.  0 is the usual
> > value, and is also given as example in the SYNOPSIS at the top of
> > unix(7).
> 
> For the same reason with the previous patch, please drop this change.
> 
> It's not worth documenting.

Fair enough, dropped.

–Günther
