Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616906;
	b=xd43mhUhOuFpWNWZH7wVgvS7srNF5Zwhj/8aAUOi+kjj5FyysGR0PD0eqegBAqRVi0fE
	 h0X3ilT7/+wGpp1pidewSJ0l96EQANDAWWGcr7VF5+v9hIL20DWTs5aQn0pxT/Cxe5x4B
	 n2ph2mlZbhi5iLyjhoPcffvUOido91NQcpAGkIszFIst2LN/QlceZNa5Kb4O+ojxzMZJ/
	 Vdsq8QquL4zskknGlxcQSmI4UTLs7V+FyvxTPGEuqR/9DAUsYlRIUX80odG0aT+aTmdJP
	 I1ZVdW0Yery1SztcM4evHkSviAvMKxDhpsDo2/JCAtlVeG547+zYd3yHWf0e1gXTHhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=aeM7G8ZptunOmSAky6KoMZh7ZFdNkSrp05aFtXMZHE0=;
	b=5dasy1oXVB7GCsrSjWKXSzUhkxPvH80DtDEWzjyza1qGHAb0qnl3uOhj7b9S3yls24rx
	 QG7lDZLtyEU/b/0umUSa61DdeyS3dWxaC6hBNw1iKV83P+OoPy9fAy0VclHTvYqmxT8xY
	 lnBpPoiFR5WmkjqYH3rWy9uTfi0tR6Y455/ivvQ+Z2ikT+aMGgZoNIph6pQDAblrOk8yI
	 DNZNlSruQdxKGT4DT3N8j3DmlM29PMJS2kGPfG4WYX0U6/yoClfaj8Z9d29fB9ktNinbB
	 rwWX8F7GVqaIdcro+hycAO2CLJakC84xUZ02ShDIztfdwJddHk1oqgsdGpBSJhbikow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tFq6NNZE;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A777A606A319
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A777A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tFq6NNZE
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so11287955e9.3
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616904; x=1793221704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aeM7G8ZptunOmSAky6KoMZh7ZFdNkSrp05aFtXMZHE0=;
        b=tFq6NNZEprfUymVb3/7oEVfMEZ8h242ww6NpdLmhJgqplbaSBkTWttO5xqq3cdgLUp
         Mc74T3JN2P1MqN6ovdN92HqafynnyKS1SFoVUIdUbhQtRfWyXhuIZcIwksuSYPhl6xy7
         yFOuL8Kx6asrSbZE93OTdMmBAjFoUp60aPp96vA2wWd+FJyuj057q7s60/SRv2RRsNUI
         pkJDDCTytAbmr+zDNmfpZCghwsuxpSqH7Txb//469Y3qn5at2hi1X2C750FtlQzMIWIj
         A0vrCuEZAGUKS30XudhMTDXVOXS7pw0asw5P1LlNVrcKCvVUnBGe4VA5Uqb4AjeRvcl2
         RFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616904; x=1793221704;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeM7G8ZptunOmSAky6KoMZh7ZFdNkSrp05aFtXMZHE0=;
        b=RnJJqYbYT+DF79IHdP7Uummltp3y95E2+FHkc7SD1oB2kCBquWi9ZC07tafWQZhZCd
         4NWAZjxTq417B8iqSZ1AQMstgkblc5TMnvgjRyrP4Uzw7IYB+Jx5JG8pMT6Vc4PerMaB
         AzdKl0v0DS1CnfuvpvNleISTpFjyzlX5zfhUEOETtYkGH4/MeI5G5l78U0hewJkT9HNc
         sHdzlsDSiri1gFs30sWEDDrHAbKf6XZ6u+hSscWQcFN70NUh3u5LYpIOpiRASlaGNo+w
         lloUrgCUu5gOHIvvYZiu6/fIFM6rHofJ2IfDuXjBilGTAlDvkI815DiTpWcwCtQ0etRD
         XZaQ==
X-Gm-Message-State: AFq9FYKgsUAkhx61mVENh+U5wBf42iEHO6H2a44rZXjcCo0muRDr08sz
	Zeo6CugzxOd4iFKykGh4ympydsrDvEG8qwuilL7HKfc1wv9J5WwFeFZ1je+qXXvg
X-Gm-Gg: AYBFou0XotJYTVZxwxRCnx2EaQCCjpznL6mJ/q3OjrHzQDjobYqzzNuLyLOVloWr3si
	vLzNPYW8lSHWA8jiE7C/kKrJI4/TIxf5qt1sAV0kaSnRt6M9ul9SFRM3Z1wSYD7F8fWYMIgq1lj
	Pu29M3hqsbUJHpKzfqyrqx/vkyGAHp8QDCOkYMUXUiK2fueIDwAhHvm5P+z/i/OVB6hcjoLQMUP
	R+jLmd0e0wwK6h8jFAdc3rCyhWagg+vf7ng+cUfy+QpZQya6oLSWsGuaaU2DN9vtrdPaEFNZoha
	PzrOEr+6EECatRXPHJuXMHZvYyibbYktUrMFKgBwTQTJ94sSKj/T942ViAcnFDApIrShyP0FvgU
	nouDq70Ogn9RXoo91Nyo2R/rcCTVFFLl+Ca/2PbtykRc3eQ+9CZM7HfJmquVOIH/O3vLlPjQKS+
	+oHCH2JJnh8iqP6Urc/pPuLGB80tUR4ktkLkb5ndcFgEWPR7NBeV1Q9sYkRTBlkIZ33C+/kj9mS
	A9RW8hhFkDUIHQOx8BLAhFxXXKLlPZGbvnQdOwXA9CuftUAjTSJ7VdaQFmGLCK+0U8cGdp3OcfA
	Jj9i
X-Received: by 2002:a05:600c:5252:b0:4a1:d52e:c2d9 with SMTP id 5b1f17b1804b1-4a1fdb1c387mr61119835e9.23.1792616904026;
        Wed, 21 Oct 2026 14:08:24 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203add648sm18318405e9.1.2026.10.21.14.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:08:23 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH 5/8] man/man7/unix.7: SOCK_RAW is accepted as an alias for SOCK_DGRAM
Date: Wed, 21 Oct 2026 23:07:57 +0200
Message-ID: <20261021210800.27338-7-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021210800.27338-2-gnoack3000@gmail.com>
References: <20261021210800.27338-2-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

unix_create() in linux.git net/unix/af_unix.c does:

	case SOCK_RAW:
		sock->type = SOCK_DGRAM;
		fallthrough;
	case SOCK_DGRAM:

so both socket(AF_UNIX, SOCK_RAW, 0) and the equivalent socketpair()
invocation succeed and create datagram sockets.

Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    For completeness;
    
    It is more complete to spell it out, but on the other hand, people
    should not be passing the SOCK_RAW type when they really mean
    SOCK_DGRAM.  I'm on the fence about whether this is useful.  If you
    want to omit this one, it also feels reasonable.

 man/man7/unix.7 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 232fdbf4c3cd..29843235def0 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -39,6 +39,11 @@ and (since Linux 2.6.4)
 for a sequenced-packet socket that is connection-oriented,
 preserves message boundaries,
 and delivers messages in the order that they were sent.
+On Linux,
+.B SOCK_RAW
+.\" unix_create() in net/unix/af_unix.c
+is also accepted as an alias for
+.BR SOCK_DGRAM .
 .P
 UNIX domain sockets support passing file descriptors or process credentials
 to other processes using ancillary data.
-- 
2.56.0

