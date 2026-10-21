Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617799;
	b=aUMKsYR1L/OHWUW16UZl/ILH2JTZH6P/8Vde8VryatPuJHH/HYaCj1iEoDMNSW+oPCuD
	 bebaJcLn8ehmpBTQboiSrOUemDZW34cIcTKdpEXFTJvajqVC6UvBiBITZsoyWw1Kxt9B7
	 JMItP2RJUfSr4jYB5uyrD1UNl9TfChXWE7H8KJztTGb9FsUvyxRF+8g0wcClf7fd7mHKJ
	 V8IuqxZv/G3hDtCZi93bTQVmu8RGnVqSOHD7nrvVksBh07ApenjvH0E2FDeBsuYtWfocN
	 xHVBn/kxXtf8WPyN3QKP9pzA+FtdXmuoUfN+fr3ekE1owRqYjZeCdTCt+f81svIp8uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=h724wxDIaNQL2OC3v1VQMKimyUlnyKHmks0lhL3N8xw=;
	b=ADj+FFEMxHNDHnQNDTKQ3It21cTYMovq6WK+PgBLF4M3ZQ093aUlvfPyL0NflTFrqfjW
	 2nrlcwoLf2sFI0FjyG/ziZRD92726VQBM2AMJb87vcoyU+qM60mig5WFwtDdO/SoxZ/Mu
	 J2oTrHpsRbqqXL84rTYITRkXHTwtWmWs98Wh0JHJrtLOcYnQNsoWWGykzKTDw/CaSfFlR
	 ZYo5v5saC063NaC0uN5q9+WoXrQTI2sR8uh9FfVi2oZWaKW5ka+rdxUyouGTafrnkI7vC
	 PCqTsZCyTTcXI2kVXOv0LQrhZVhTi6K2zJA18AG5vtlyzA29xdhHBzncsguh7N5jimw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aoj+KPSU;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C91C606A319
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C91C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aoj+KPSU
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b060ec084so940106f8f.0
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617798; x=1793222598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h724wxDIaNQL2OC3v1VQMKimyUlnyKHmks0lhL3N8xw=;
        b=aoj+KPSUtNFsq467ds7cGKsm0U96cDHEznTUnbRNLKK0K53cfjmpges0BCRgcSKZvE
         GUOsmw/dcrUj5zhautQnf5lrYzIOoF/NlRB650Vw+ko/wsgUD4lk0/LeavBWcxMWDWT1
         P67IHJ1cp+q2hCCwBrFj+EFCX5CfBcEsKLD7NA+b6kb3/QszjzXrdUcrWYMN9em5t+SK
         5W+DpJFzMEyX3pz7E2EL/hdHu0J0Ojp5inaNbXmp2ZK13Hpk5XtuglMEgEny9Q0rmuUX
         GllsvjSbp3Vxrk1/jmA20tYEnGPc95evuIGZzGY/1OogZhdxe2X2bxcQ68jGfAPQlk2G
         3Hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617798; x=1793222598;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h724wxDIaNQL2OC3v1VQMKimyUlnyKHmks0lhL3N8xw=;
        b=zAKbqhLv1iGLCQtAIo0he/FLlfAgAAjNQoRM4LBsrUPx9KWgpPGPyKjXRElPzUKSb3
         dsrk/js+ojBd2tqtUNhHlH+gNdi5mhAgaK7B8pgC2lRBGDJ8MNjeAvj2u2osQhJud5RA
         PJN5iADM/vpRS28QhRx7OTF7dTo+S63D5rQuzZPpRg49SHlLZs55/v63CSBYMNvBuyLu
         1ifZZqC6xzRhpOwrww63/JCwaf3Es1jC9+2lmEa6NG1Yri2qeKE4dz/+4ushi4KiwFWU
         P88yrF92Dlrvxiv1GiPW0/Kizqe3SWtS2AZ1fIdNQ+dK9Sk24aSCwCn41Pd87Ny6THbT
         OP/A==
X-Gm-Message-State: AFq9FYI7PsAsnCLau9S8ht7hO4I4etNU7jyWs4h4AnvYs8PYPqAxBtze
	ZyLxQJv5H6FCcbHYBZqJ5gCf2BQpIks7r3Z4otTNz5+AIbqBgoSdAYai
X-Gm-Gg: AYBFou3kEo7YyAcTt315O1BTjPEG//kxIm5JC7+knJ0v/No6C0ZXolcs/qu9M+UNpQL
	JFMgHPCAVwkpFM7JA8Eys9QKiWGsXofMODd7oBSXMi8NZFO1dWyFG5yQ/sqQdCek4MudukgQlKF
	5tMrG7+VpcdQrzFA2A+2MS/CdmSNE3mxE6tSjH0WieCb5QcbRW4L7xCNGWuFjK5lxrDKsTvPvmb
	QcSKLIfjdNsTqRG9ZZnt58wg1J0S3aOsbdBy1UkoLOswOS6FUb94qKhg0ykbN1yd79Bfa5H8Ssc
	5Y4zUkg/B1sQ1r59dqLroTOKrk5CTfzfsSCPhEUTU2wpnWOaU/nP8pIWF0JhBKQKSO6dUs6myFu
	BRby3Zkx/CdCgUnalPp2xyUHKX8J94+MUKEBHz/it+Ltq6Cnsp+71W0lxvqlmn4jTf2QgmUSXzp
	KxSe0ey2CNoigviOr5jHHVIFhNdUX6Tk1rfwNKEYXaTxOB20eiWjiiurUqbs+VAvbhizU+XqLDq
	69fSGqY5qHzVCB65oRKJiM374twvG350+TUBYk/xY3TUgyTTAIEE4AcpQyhyoRuoBAhWQz27gC1
	FJRw
X-Received: by 2002:a05:6000:bc5:b0:48e:cd3:64f9 with SMTP id ffacd0b85a97d-48e264e6f3amr5720038f8f.55.1792617797637;
        Wed, 21 Oct 2026 14:23:17 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254eeef6sm8012065f8f.8.2026.10.21.14.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:23:17 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH 5/7] man/man7/unix.7: SO_PASSSEC: wfix
Date: Wed, 21 Oct 2026 23:22:54 +0200
Message-ID: <20261021212256.27961-6-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021212256.27961-1-gnoack3000@gmail.com>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
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

Use "security context", as in the description of SCM_SECURITY.

Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 man/man7/unix.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 4abd216d19c7..67dd10cc146f 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -317,7 +317,7 @@ and returned as the result of
 is an integer boolean flag.
 .TP
 .B SO_PASSSEC
-Enables receiving of the security label of the peer socket
+Enables receiving of the security context of the peer socket
 in an ancillary message of type
 .B SCM_SECURITY
 (see below).
-- 
2.56.0

