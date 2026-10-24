Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792817879;
	b=f8dOWmQdUA8TD45EiZc3mbTM7VNUoymXHMDv/alIIY7+zvXHLe3EtYCIn6VJMEzPLlYO
	 sRcG02SuQw+8Rg97w2wyoAGcoPtEqq4TkVUkxoC+e3cdQ+AEpqashecCVURxdoiboWbWf
	 8HbhnJseakHq5QBjnOoI2hOWNKuw5/eeIB4rHFF3tzoENhG8Pknli37AXIQUW7xhljhEZ
	 4UeAm4fuvi94827gxWigQ4ytH2g20xQ0XVtOa7fTpKzFGtVsD3jGYArHiigvb9pzsqOfE
	 dV/raR8WBRtWXmMpSIRC4apqhQBUvJwLzxmC5plTlDUc7O0Oqo8uFponqzKi3QA5+2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792817879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=O90QMP932WQtln0v3chKpRHRm9E/6vbMwefbqYhynMg=;
	b=lEF+HoRjXgUx8wx2T7tiRPV/zaPE84kZFBW4TZlzM8yQwzChXa8LBBvdzsFJxHRtx1xu
	 3t7m+CT5qEbOYLVDr4pUwj1KPpicT/atrTVwrNTjTVv/YBNRXzB7OprqEr5jOtqu70vuX
	 1tNNOXbAJQWAN3R+Yb0zatcXIXNylSztVUfu87OC5cV5ZNo1w5JmnMf/R+QAUJON5jLbB
	 U/TsuPHskWp5uBq+K6FaShjoxcbKgaMd3v5uvbqROQt1k6EQsBRJsQDLhwn8A8C+RHXdG
	 hAA/V5y+IU2gzfvwZtBxHHd9cTwiCpN9hWL7Dy4nmYsPuQmAF36WNyjGCp8wqgtlkjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="p/F/+M/Z";
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621F0606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 04:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 621F0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=p/F/+M/Z
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad98380ccfso2259158a91.1
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 21:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792817879; x=1793422679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O90QMP932WQtln0v3chKpRHRm9E/6vbMwefbqYhynMg=;
        b=p/F/+M/Zlm7wPDEJEc5d6U+NaCtnlZl4+8ZYup+0z1CV01VEGmn9IpDRog0KQZ0jBw
         50eNbCOShsFlHtseSM0XrclxaYhgnP0oeo7ju5V0D4IrwP+6ZPFA8H6erKR1Cq7b7NQq
         g+KpCgKGkJbbyKiwpaJcz+Aftx9HHKU1ggdYs62vcfA0RwRJdmvrATU9RqEN1utF7BoN
         DEoJolMpXucm/HwGTOsLcGzrGOYHsy7zLUdPKx2pvA2VV1tDBNOJMaj6MCMBFrVGNsZb
         e6hXmVpUwDY94U6SPa/003IPzYEetyG5DjHGT47j/ZH78/DqDJXKtqo6GZsJkTn9slQ3
         +2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792817879; x=1793422679;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O90QMP932WQtln0v3chKpRHRm9E/6vbMwefbqYhynMg=;
        b=HYZnlWSdmEdnKGji5qRd/Kz6sKgNgypNTZwRGPC3B6nI841rMKMDT6w8U34HbrHjU8
         0NZmLmf/ya8L5ISweJwwJc7ULhSAnstHFEtUlzQ1IZ+rpk1uueJS/h2PROummGMLH0JE
         wc/rRvhzU6juUoDmRNx1DbFXJTnTdmvhpbM12mpAJdM0XzHrMNgVqozIF9emNGFXgrzF
         s69t9ATL7dXPXcV+Gkq1w49+ok70IC3QMXgNnkMeflc1hENdyvsFsxXxqlle/gvWTW4M
         vjqnM0kvARZ7qDhjXrhZ4W+HEdwn3Nby82afq6m4pduIY186SXOBMf41Yw/MUJty4HBy
         yN3A==
X-Forwarded-Encrypted: i=1; AKwUvBxExnaKvAfCPE2ZdMojHN7lzh1zWMQIA9L4YDizNlNrpBhvxJScs95wIRvzdPE6tnLNA5mma4gUw28=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+nlbpb41irR/C2D6caH6KKB0qcINqsVHg/i3u1I97aJrkdpov
	RsmoafrLfmX2ipd5NItm4xK+yOHROiupruMyW90ujbSlCRUpOORpc1wIVuB9uyY0L/wH98flXgm
	idDzHMg==
X-Received: from pjbsb7.prod.google.com ([2002:a17:90b:50c7:b0:3ac:6795:2cbd])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3812:b0:3ab:27f0:c90b
 with SMTP id 98e67ed59e1d1-3adeafc470cmr1180278a91.53.1792817878450; Fri, 23
 Oct 2026 21:57:58 -0700 (PDT)
Date: Sat, 24 Oct 2026 04:57:58 +0000
In-Reply-To: <20261021212256.27961-4-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021212256.27961-1-gnoack3000@gmail.com> <20261021212256.27961-4-gnoack3000@gmail.com>
Message-ID: <atw5fW54s8R-5a-G@google.com>
Subject: Re: [PATCH 3/7] man/man7/unix.7: Autobind: Clarify when it happens,
 and mention SO_PASSPIDFD
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Oct 2026 23:22:52 +0200, G=C3=BCnther Noack wrote:
> Autobind happens if either one of SO_PASSCRED/SO_PASSPIDFD is set and
> either connect() or sendmsg() happens.  Mention SO_PASSPIDFD and
> clarify that autobind does not happen immediately when setting these
> socket options.
>=20
> In linux.git net/unix/af_unix.c, unix_autobind() is called by
> unix_dgram_connect(), unix_stream_connect() and unix_dgram_sendmsg(),
> if the socket has no address and unix_may_passcred() is true.
>=20
> unix_may_passcred() is also true when SO_PASSPIDFD is set, which was
> added in linux.git 5e2ff6704a27 (2023-06-12; "scm: add SO_PASSPIDFD and
> SCM_PIDFD"), Linux 6.5.
>=20
> Also, the old text said "not yet connected", but the condition is
> about the socket not being bound.
>=20
> Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
> Fixes: 0cf2caa41ea6 (2010-10-10; "unix.7: Document the autobind feature")
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---
>=20
> Notes:
>     Rephrased the LLM-generated text so that the canonical description is
>     in the "Autobind feature" section and the other place just refers to
>     it.
>    =20
>     SO_PASSPIDFD is unfortunately not documented yet at this point in
>     time, but it's still correct to mention it here.
>=20
>  man/man7/unix.7 | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index a1dce8c47246..ded82768322b 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -301,8 +301,14 @@ if the sender did not specify
>  .B SCM_CREDENTIALS
>  ancillary data.
>  .IP
> -When this option is set and the socket is not yet connected,
> -a unique name in the abstract namespace will be generated automatically.
> +When this option is set on a socket that is not bound to an address,
> +the socket is autobound to a unique name in the abstract namespace
> +when
> +.BR connect (2)
> +or
> +.BR sendmsg (2)
> +is called on it;
> +see "Autobind feature", below.
>  .IP
>  The value given as an argument to
>  .BR setsockopt (2)
> @@ -370,10 +376,19 @@ call specifies
>  as
>  .IR sizeof(sa_family_t) ,
>  .\" i.e., sizeof(short)
> -or the
> +or if
> +.BR connect (2)
> +or
> +.BR sendmsg (2)
> +is called on a socket that was
> +not explicitly bound to an address
> +and that has the
>  .B SO_PASSCRED
> -socket option was specified for a socket that was
> -not explicitly bound to an address,
> +or
> +.\" commit 5e2ff6704a275be009be8979af17c52361b79b89

Do we really need this SHA1 here ?


> +.B SO_PASSPIDFD
> +(since Linux 6.5)
> +socket option enabled,

You will need to update here with SO_PASSPIDFD_THREAD,
https://lore.kernel.org/netdev/20261005-work-unix-passpidfd-v4-3-350183b6e0=
2a@amutable.com/

but I'm not sure to what extent you want to clarify things.

For example, is "the socket is autobound when it passes
credentials or pidfd but is not yet bound." too vague ?


>  then the socket is autobound to an abstract address.
>  The address consists of a null byte
>  followed by 5 bytes in the character set
> --=20
> 2.56.0
>=20
