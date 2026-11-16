Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790353;
	b=eaAjMFTa2jNcW4gntXNoMbBj8gI85vdeFiGkeLkbdnCzX712A4KMEoSSTpUXdjNLckkN
	 yTUrN6gP1LllA0tfDrOELTpgnmaK2HG5boftD6Mb56qVxdaEdfg2wjC2lBxESzeicopyD
	 Xly/9dPZVL3cTpZGLJEW/HrpAqAbBhiUSeX0FZRcMS4u26twPYvYQQ9QkRs17e1i9crLR
	 OYysZCwLeiXN1BtQ4icMcKyrGLRiZEvIRuTUqZk2wfgl+iXSmVDJiJ8i5DGiirEpjZA2G
	 oJC/FU26UX/LTfG5riH8pKLWMfLJImIakbC56D/WY4eMx1xCIibEw+tYIlSv0QaZUIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=VT3WjsEZiQ5a1FiBCHJ+awFmPBiTX0v4a/HZzxXP1yA=;
	b=LqUT3rOJnRs4NWzxfHedQFw5JSe5swoZWYBeohkMRiWvllQTRIIwdTUWKg9kdKDYfDlC
	 sKDC+gkc7rwVMM8asnRW8rpqhhbS1lgmPkiWp5CMx1bLbZEC9X2uEiRncOxAOU2R2nE7k
	 44IHT6Hgcm2SQ6DJPyflcE5GovwFBYIrFL7A9rH1AQTS7AAhP3qcj3q7t5k5P3Yo8Ahyi
	 D2RXq/AmcKdJk28GMMjeOzbaXrQ9/cmHsjn1JpkxPn994tz+sUwQ6EcxM+u8FCTvahfl0
	 R91k8QHf+kQ6I039PUL7gGIJqf3NvbUQO1ncOCNj4ia9YzzrxFoakoDpEjqlXTb5nVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=id15ru+B;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5197F606A31F
	for <linux-man@vger.kernel.org>; Mon, 16 Nov 2026 00:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5197F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=id15ru+B
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065e2933fso3987603b3a.3
        for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 16:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794790353; x=1795395153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VT3WjsEZiQ5a1FiBCHJ+awFmPBiTX0v4a/HZzxXP1yA=;
        b=id15ru+BTMxOxdoru+0vxNkPhUgyaH2PD+DGOCgX2Vxgit2lxcUcqzdho+GBCuvP3z
         N9XbfPz0TCNHUBiGreRmeg0LFgenoHBrwbT8Ad6+hWH7yRMjbLVh5cNRVDA8JzxNI2sv
         eOxQaBoGAsc/EpQ7DllMtSSYxzG7/iRXNFY5ZxyccTu2D2qJDdN83rYaOH3kXYzAvvj9
         7tjqkpWopNnQoTkjnI6b5JcCuPfzw7lv46zoxhdJh5IReR9OcIwwwDcQYBibfhPg2CSy
         LikKZPvnNpeQmKo/9tM4TAq15RBMp57lMrZ2QIQY8Pyzfk/92iEbygqtc0XFceigb/y6
         zuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794790353; x=1795395153;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VT3WjsEZiQ5a1FiBCHJ+awFmPBiTX0v4a/HZzxXP1yA=;
        b=eMcw0GfcEQITSoMuFizUxvShcW0xvhu/mDpyOm39ENviTJ2fvCBsfkBiZaNlYpz3HC
         8abIZTX4HxlQx1PhvOb//rn+ACjKAfGumfgEG6k1X2pKgPr0k80xKgqWoxZC2USUegmw
         /h9F4/1cDYy5cmiG4b7WS/2fwf+1s9Qxbe6B4APpIFA7ZB/5VgtWFJkPO0uzy4N1Uc/A
         Penl7ej7N7++S699fSCr1ASl8kUpSsPPSwsAxz0TaIXC5TydJoZwRPweYhxMD2RkwYL2
         3NBulZcwxFSSK48a5qZRgUAqY0zzxc1Eca3C1yQJU1luG3rptGcjQph4sRjjgaJsXMpW
         S6UQ==
X-Forwarded-Encrypted: i=1; AL+hErGQQjOlFV5fYbjmIFtE8yIEVXl1X+DyaRoWYt7+Q5F9ArFrih33O1scMmn4KJxvt4qG+3iscTzu3Pk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/zezfa+ddemyFEFknDSM/UbRamZqlA/mFWVrucUa4mKByJvzU
	ATuiySStAzAKj6KNR1TNQCHM1Vkd+y7iYX5ADYTIRceQr3GrELiI+m/7ku7H1jVtnyc4zVqytk0
	XlsUyDw==
X-Received: from pgjb4.prod.google.com ([2002:a63:cf44:0:b0:cc7:5400:3218])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a10e:b0:3de:4c08:174
 with SMTP id adf61e73a8af0-3f7a7ccb1a9mr8980011637.33.1794790352488; Sun, 15
 Nov 2026 16:52:32 -0800 (PST)
Date: Mon, 16 Nov 2026 00:52:32 +0000
In-Reply-To: <20261103202211.13820-3-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103202211.13820-1-gnoack3000@gmail.com> <20261103202211.13820-3-gnoack3000@gmail.com>
Message-ID: <avpTxVySkPfwWolT@google.com>
Subject: Re: [PATCH v2 2/8] man/man7/unix.7: Multiple same-typed SCM_*
 messages may be sent in one message
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 03 Nov 2026 21:22:04 +0100, G=C3=BCnther Noack wrote:
> In the Linux kernel code, __scm_send() in linux.git net/core/scm.c
> walks all control messages in a loop like this:
>=20
> 	for_each_cmsghdr(cmsg, msg) {
> 		// ...
> 		switch (cmsg->cmsg_type)
> 		{
> 		case SCM_RIGHTS:
> 			... append(!) file descriptors
> 			    up to the SCM_MAX_FD limit ...
> 			break;
> 		case SCM_CREDENTIALS:
> 			... replace previously set credentials ...
> 			break;
> 		default:
> 			goto error;
> 		}
> 	}
>=20
> So it is possible to pass multiple SCM_* messages -- they will compose
> if possible and override the previous value if not.  Since their
> contents are being conflated that way, they will appear as one message
> again on the receiving side.
>=20
> Keep the recommendation as portability advice, and describe the Linux
> behavior.
>=20
> Fixes: 5b5cb1958062 (2018-07-10; "unix.7: When sending ancillary data, on=
ly one item of each type may be sent")
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
