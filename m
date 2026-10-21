Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616899;
	b=ig2JimfmIWRgYpdop58L5Rt8Nzph++Uj5BiD0NhG6Jp9RTBLtMK8NCre3KA689n8hX1K
	 C4DKo9aI5ZPu/7oiwHmlbP5oXNb1mvULO8Rs9nN5lRdNtE8AwZOVlEzNL83h3WugbrjKW
	 Gmg/lJ5/d8fmkus6cW0K9ItPLxX1+HnMbp03891DmkcRlWUetkuDPmXl4eQJfEhZq/Smv
	 qA3G6Tw2ZOSDAz3XLn1w5cMaoPGnnslkPUlSCznUjVQqmXvvt++GKi74IEZX2sOo5k6Dp
	 PjvjI8A47KQPqNEXvx4mJvHx3ufBHxq8c0MlMfCGVNEze3wikorDGlB8eQnWw4mGQMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=GffxmrpYwuAgd0OcuBOxcLQle2w/h8oNqciFBSfSS+s=;
	b=e3wCWzPgzwWpEFe5//XmDGFXnYjzRGXStRrFUd+O/mnrRh3wCGKLbB9JdIbphi9pxxo0
	 /wwcD2HE7OZ7VN2FCWsBNnTM8kBwjTbeAni5jLZzyScNvWUvNbBsNCMhf1yFzoWW+emLN
	 jkbxZLTKMQdaCoo85Z5GOV/Yp41iyIPmDAJ9JUl3vqOn0r/53EE+vv3ZQMAXWMO2UDP5i
	 KyWdaNa3Vq+57fQMaqjuS3G0jZyPF2nBz1FsJ8jBHfYwel8X+jaP5lAPZ6cR/roNb6sfd
	 ZslWmyrg5KnNmN/rKJVOwaZ0gP5DzhCU0x8Y9K9XVEgvwXMITRYFuZJyIu2WCvFvYIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="dM5/BYmk";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B942606A31B
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B942606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dM5/BYmk
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso12073335e9.2
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616897; x=1793221697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GffxmrpYwuAgd0OcuBOxcLQle2w/h8oNqciFBSfSS+s=;
        b=dM5/BYmkEQ1hSTgqQ2Vpk3z9tsbt+7h10d8muHpCvlJD/UScBF1OuuKi3B3JgaQRIm
         Vc1tDxryxBYSPBpl053Z/cIU20kgSoHUwpogLzyOH7MAiWTQNs5THaGnygZzH8KmvsWU
         DxFlvaKtSG21Dg5/ckQbZwIDutVJm0BoBo+HIXuuzdDFpcMRyEwBS1/9Rg43JBFV/guI
         hvAYhn8cejXwMFFGE+GP5Sw0xXMHWQgUpz8gw+dbAYAU/27mWCT01Gr1VRuXXboMkkl0
         mO6rxiSZcDV47jZM/mmbCeNcaczHmoGHQ+fS0YGsLyycu62MnhwamKK5vZ1QcmDhaA0A
         4P5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616897; x=1793221697;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GffxmrpYwuAgd0OcuBOxcLQle2w/h8oNqciFBSfSS+s=;
        b=C1fIvCbjSKIP5BCGxaWAfW+WBUJJpEIm3Kj+XJk5UMtVy6uH21VmNFYn5nccuJfQSd
         L0hQ8XHCLhZLvtGEb3RDiTWY4z/ADHqSCzTemmx/0QstaeTDJx72XVEbcH1Dr+4HXyrk
         Rxcv8mcFXldN/60USZLhMKFE1RIVrZs/7kVoYN1w6wJJ4P/ng73+Hd25mHgR9ewucR6s
         uIn6J7VviSQXkcC4iqeZ/Vfx88lRBP4Luqo0W6wtnZ+NmmHZgijVvhxdRShjGFVr44I0
         oK88MwHaexjcVCf50RYH5l3HZoagaIFuu1O/L7VU+WDpoRNQD0d81tzStCI9bwAirpU1
         zxug==
X-Gm-Message-State: AFq9FYLmpRnsn9Cb90/7BotoYpKx+CtdwAojOyHDA9UNfhcE5V0kB/X5
	eXLTV8AcoL5xXvj2lAK35BtdhAqpdKBJ1GoU3gUDB3x6q7RuA4DxjbXw
X-Gm-Gg: AYBFou251oFwhJ3WqVsyeHV9GS1Lxi0lhl2YUVPr1eKRHaUjBYMeH/Fk1wu2X4tP51v
	5At4ieErUAtCOTurVJgjqcwUMpsR5zeli/r7b/of+Q430ulgY0pS8J0pWsHVcsiz4ZzJBY3Cxey
	hD9w3EXVYfbVVB8DmtdVyB4rRweTcK9lwecLr7ie4ubpA5oj+ptNcFrcG8XCadRz95GxUszDzqi
	oRRj6uMvDctop9Jlf7YNg0xpYEPfmQSOp/keDJmvYh/P39eYe5bKHTlzgYjhRDzLqHHfqOjncyW
	mdQlK0zDZbjhRC+nv+Dos3wC6Q9fuCZEU3GcK/ODDoNc423PhU/V5GfZVL+zkG6WiF3vaz63x/t
	43TCB5fUyaZ99tvwl6C1i6NnWammmlUG4LcggqL/vnZwdS1ssTK15vTUW0vGK5fuSNVd5rY9DbT
	89Ywa/o1XZrh0uOiz2sFoiP0JcaAB7XU5W+O0fCEDRleCRDEt0pAq1zsT2g8HRVepSsOhq35Bs2
	WRwFpWKLhAesg9vwAnMcj9JyRHAfTHdsUdZ4T673X49YFGVLdBR7AcTFQ5AkFuIkPWtSUuwgWYB
	1+UrCpANW0mm3frSSoqeh6Q6Yw==
X-Received: by 2002:a05:600c:8b6a:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a1fdd3bc69mr62320875e9.30.1792616897162;
        Wed, 21 Oct 2026 14:08:17 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a205c945e9sm9636095e9.1.2026.10.21.14.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:08:16 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Jon Maloy <jmaloy@redhat.com>,
	samanthakumar <samanthakumar@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH 1/8] man/man7/socket.7: SO_PEEK_OFF: This option is no longer specific to unix(7)
Date: Wed, 21 Oct 2026 23:07:53 +0200
Message-ID: <20261021210800.27338-3-gnoack3000@gmail.com>
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

The option is implemented through proto_ops->set_peek_off, which is
nowadays also set for UDP and TCP sockets:

	linux.git 627d2d6b5500 (2016-04-05; "udp: enable MSG_PEEK at non-zero offset")
		Linux 4.7, UDP over IPv4 and IPv6
	linux.git 05ea491641d3 (2024-04-11; "tcp: add support for SO_PEEK_OFF socket option")
		Linux 6.10, TCP over IPv4
	linux.git be9a4fb831b8 (2024-08-29; "tcp: add SO_PEEK_OFF socket option tor TCPv6")
		Linux 6.12, TCP over IPv6

Cc: Jon Maloy <jmaloy@redhat.com>
Cc: samanthakumar <samanthakumar@google.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Double checked in code -- this feature has been added to these other
    protocols since that man page section was written; I made sure that we
    have all relevant commits listed as comments in the man page source.

 man/man7/socket.7 | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/man/man7/socket.7 b/man/man7/socket.7
index 96f6f173a40b..ebe0264d7ae4 100644
--- a/man/man7/socket.7
+++ b/man/man7/socket.7
@@ -662,14 +662,24 @@ For more information, see
 .TP
 .BR SO_PEEK_OFF " (since Linux 3.4)"
 .\" commit ef64a54f6e558155b4f149bb10666b9e914b6c54
-This option, which is currently supported only for
-.BR unix (7)
-sockets, sets the value of the "peek offset" for the
+This option sets the value of the "peek offset" for the
 .BR recv (2)
 system call when used with
 .B MSG_PEEK
 flag.
 .IP
+This option is supported for
+.\" commit f55bb7f9cb82dec2f2e803d7bd0fc5929248e4d8
+.BR unix (7)
+sockets since Linux 3.4,
+.\" commit 627d2d6b550094d88f9e518e15967e7bf906ebbf
+for UDP sockets since Linux 4.7,
+and for TCP sockets since
+.\" commit 05ea491641d338422edbd87af3b311c16ea762f5
+Linux 6.10 (IPv4) and
+.\" commit be9a4fb831b8b6dc5724dd3e61973ea91b413ec1
+Linux 6.12 (IPv6).
+.IP
 When this option is set to a negative value
 (it is set to \-1 for all new sockets),
 traditional behavior is provided:
-- 
2.56.0

