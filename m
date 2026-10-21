Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616908;
	b=GeLbMcoPMwJqBiJ80MwHf4Znx0HMjORIUkOkpVmy0D1skOHTGLbngiYYBofqDBFKOp/K
	 VemCKx0xYUiJO+EPXztlel5FeZYc1wsMLAq/50CVKRBOA67Stc26WAxGHMisa/g/m/A3+
	 E7KCGXtomZhXfnfslbOxZ37pojH3QvU/8TzTeGCdChg92KrKKvYRDZo997QnWN6s1dtxM
	 ZuW7H9rgtR6uYH4L3a1q7SIy10s+uFbqgYf1VxEjEkh1UdUuRFvisJBf890GGWoQ2xKIT
	 pKljpAR8z+EftNUTPNcPewuXvZKvs8pBg3ZLPxIZOJ12l5gsRsrq56QulW7b62L6MQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=SfUfrj/X+Jg7sw7TdLtukfVl6mQ3zerKzX9x4xTH+2U=;
	b=Q2HIG/HGYnVZuyNEjfwxF34ljzwj7ZMVoGPMyXVCi50sKZNIa4xAQDXQBH/En7WNQja0
	 M/H6fZiZIORYdwVaMyoU/2Khhyt9lh79kTCq/o5DUBfoWddETUKQHleD4w/5aSMl431Ww
	 8oep4A1ycb5WxbGPxapVw9OMKcS46idfE7uUMAAYnTS8IkS9RnPgG3y7OEFgcgknQXhnB
	 xQy2J6k0nHko6W6HHeGtIjaJbyo+pTZF58MxfhTvXOgS+1+ABzc4gEcyT98XV0Kdrjbi9
	 yLz7vr6JumZvdVQeZHnY2Z94lKMgl3Lv8BLKVkQaGP6DcN4a6EPRXiHiDbLT//iH4xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b2+ZFYPo;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C4B606A31B
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C4B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b2+ZFYPo
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso13250575e9.2
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616906; x=1793221706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SfUfrj/X+Jg7sw7TdLtukfVl6mQ3zerKzX9x4xTH+2U=;
        b=b2+ZFYPoxAvLJUta+kArLJuY2Zlq+4NoU5k2DUhoZqBcEdZjm0DUrAUIJXK9J0CYn0
         uxFwLVYBXUhRxew//ejrBytsx/gRBi5H1Aa86SoZ53UcKEg/4tX2Iu5+D2JerySA6+I2
         JFxZCMjcRfjRRFfo8YmfZjh0dyrHHMXibTSztossl+KM1V8K9fiJk7g7IM2IHabDTFk3
         SDFwxIl2+mbAT2YDj83PLPRwJcSwrbdYHMBSm1UxvBPJo8Dsml/otPQhBm5JnbjYH0ao
         ja5DxzLJzoR7wJEuQymudVi4pF6RoJ8LQmlb0lFGE1dx98g4f6pQrOMkAFf5JOhCdmDz
         wDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616906; x=1793221706;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfUfrj/X+Jg7sw7TdLtukfVl6mQ3zerKzX9x4xTH+2U=;
        b=O7KuzkNPbbQAiQ7ASO/Z86OaNX6TIcdMY6gWHPaTtnq+KFu/SHDaHSx2uNLvz/PEFu
         mIPqW47t4gFua3U4kBcJjwrJOBXNkPNnvAYAR53m85F0sbgF3FeN58NQ76+2lhGF0lsB
         msLLzwj/qXUKqbc7DC+mDwppXaNQRdUZcrDybIlf0YrIItrqWetq1gxAoQ7a68qSEXAt
         IyerpTIwTr7i15KvAu6+ahr/b8GXo5aDRDDvS28lutq6dFEia1AOmOmbW6+RbVMnO9A9
         nQZZ2d1dFFfFGvL42k/keS6zPAjP39LuDmVCo8XSJhlaex8hYdVQ6oedoNTm3DobFAmy
         1zbw==
X-Gm-Message-State: AFq9FYI/9hVvGsAHvCg7qzZwNxhoxm9MMpN4vKK5GDQnAjgKFTlL6+Fc
	IEH5sPoYqlHMToxGosKtmsRe9iEZnP6eiuqpvYkrmnzYIZ1TaaMRNVk2
X-Gm-Gg: AYBFou1H03nJvjr/ZMs7keW156pTlZHCooQc50QyaQWFNtdPNUZqG0qMJhfc66K2heF
	P10d9R63x3jCuQRJwKGZenka7i8XJSxxW/vl+7zQCpDA0AnK7NucgsqUTIv4GwY7ME8vLC57SQc
	faJbJVYNCNaEf60dPirL79GmqRQoOAynFtp2ZgYNaE+ZVEKnRgvVrT2FoF3NWnS8wSIvklKubM8
	uvPi5wpOvRN0Pev6UNnkk9OMiBgoWZdHInxCPAic9WSQjUMpMnp8VihVwD1h5YK2LPROhj7KnlI
	+v/ZfTgNoRNbIJvIvIh18wp1oJpmbhgSyCQ1GVOTcPZNln80FTHeCquVhkpR68UXfmUVR9NMoRr
	3dxzZFz+9XdQFlAyYoix1kpK1lV7iqQK74GXytHzekLocrqZHSzKm7Jbaz2Ve2W7k2WsJcYqkTh
	Uc8NE7m2V35dge+XDk/bStzLgkkttTwhE1w6ZI7n6rDBPfS2eoHfRWsW3rj2ZAmSKsBvDK06B68
	l1y6e6+yCE8pZp7+k8AwzGr6KPvPi8f1gGN2+jxhuvbWIhHCSqtIluBhHAzS5fU5BfXfig5ac3o
	4bA/
X-Received: by 2002:a05:600c:1f95:b0:4a1:e722:a0a7 with SMTP id 5b1f17b1804b1-4a1fdd19dddmr74113125e9.30.1792616905906;
        Wed, 21 Oct 2026 14:08:25 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a205c945e9sm9642705e9.1.2026.10.21.14.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:08:25 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH 6/8] man/man7/unix.7: ERRORS: EPROTONOSUPPORT: Protocol 0 is also accepted
Date: Wed, 21 Oct 2026 23:07:58 +0200
Message-ID: <20261021210800.27338-8-gnoack3000@gmail.com>
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

unix_create() in linux.git net/unix/af_unix.c starts with this check:

	if (protocol && protocol != PF_UNIX)
        	return -EPROTONOSUPPORT;

Therefore, not only AF_UNIX (a.k.a. PF_UNIX) is accepted as a protocol
value in the unix(7) socket(2) invocation, but also 0.  0 is the usual
value, and is also given as example in the SYNOPSIS at the top of
unix(7).

Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    I double checked it in the code.

 man/man7/unix.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 29843235def0..054f1af75dd5 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -729,7 +729,7 @@ or
 .BR sendmsg (2).
 .TP
 .B EPROTONOSUPPORT
-Passed protocol is not
+Passed protocol is neither 0 nor
 .BR AF_UNIX .
 .TP
 .B EPROTOTYPE
-- 
2.56.0

