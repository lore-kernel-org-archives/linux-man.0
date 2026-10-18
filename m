Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB1F3876A0
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345042; cv=none; b=stbBXu3xxyyYpwaOliO5nTfm2zhA2eQcgLQTQLw7nA9ee6FMnRKtxgf78IRyR9gVcgwcUyDrJyOVTnpslPCfPBXXDt9B/rQzdYQglp1b/NoVbqx8tH8UU4w6raJ9dt2KwK2/JRO4KcTeIL0IPFC8eKe8qKWa5eM4xszOTYVJe4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345042; c=relaxed/simple;
	bh=q9HkYrQrs9fsXy4IO0jU3biB91ilIAAnaF4kQOCg8HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qb0OQyYFwuGlIu5SqYIaEX3aw6d2U8iIhi0eauaikgiwK41VMIUR5N6U+feHIyTzd1LaeuKWELTxDo/P3nt2WTvJp0TlmUSW55ZsXr8cE6qoJTj8Qz2cJkgdfjkTMYWRotsh0/c+4T9ghBnQmC2iIVJbvXgCHzn6Zb0+3JR2nSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAnR06Xw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAnR06Xw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1dec056ddso6642085e9.1
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345039; x=1792949839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XEsvIKetGzg5douUL9+/OC3UNt8MjPzNHxSUkSzSEMo=;
        b=SAnR06XwfstJm69MMZvtVOMRR/C+ymhIBCQA6cq0hUAFOzbP0KrlwO+00DApvCfi4I
         Old1aOxVUWeSzek6N54wR4ooIwYZJFMQTF9ljM9cylVQN/A39ofxvWR6xjaLSaCvZt/s
         6f2YXiv+RiJhiht4yU42U7zhoUH2VlyPSZFF/2jKZULQfhjiuQhg1zjkqm6D5caL6GpW
         YUZeyGCCoVKS6oWBQpaBDnmHd6vCrA1NZPxYVynhojyxXBZiXwELaYOyrkZlA5Mr9Dji
         ZhU8aYr2To4tgOfNf3FNegYm2Z7lYGO/1FJxf42LxcoLDa9IC2ZQRRTZ8lplCRimiW7m
         aZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345039; x=1792949839;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEsvIKetGzg5douUL9+/OC3UNt8MjPzNHxSUkSzSEMo=;
        b=dBADsWMFCY5Ho+idYgUPime353NjqxpsCajJRVMXCGwiq6lNUItM1GyiMUU7XCgtFs
         zmLRgOGUzXOzM7gyySeor1OSB/Oyvkcpc9S1k5S6DNVm+jDfX+AJ/z4nm3TEaXzDKgca
         SiQZmkWui7xE0kqZyUE0chXuqQD7HuzwTFDN3TNVYnYkYY1Eoklc4yVJIOA2RcJY+b7l
         7FRKwc00wXoU4vIECkBftYswuMU19XfwgX+/rBNm3euAYC6XHpfRWbJEcw/NUluA5yAo
         7zWVKTgPyWPthg14ibLsIXLMVwKGRE87Wc9SpiFrKmpTn7akGdlbQ4GbN4RhrBC4gCOG
         05uA==
X-Gm-Message-State: AFq9FYIlNIUJtW3cmZSFBCsHj5UdwA+7A5pHo6n4FyxZyRMHTNgFwxpK
	Q8X0rJd4qgb7IPTPD7e7wlnZ2Q3g2NPQ3+iP8vNO0bAbKITlP/S3sPQ+uO2c8Dlf
X-Gm-Gg: AYBFou2RM6qx2Tjab5+s2R7EzNEIag7V0Pm7IgxAVpMH5NCn2VHVf4bJOfC6Rp2oEDi
	1yZdZ/ORlSrZmjyRa/bx9JDGwHo1BHcdsI1g3cNi/PeRt0tY8lnqUfUHSaJcMq7OK3OyCkvvoak
	1rLQZ3oazjo7Ynu1BwDEzp916IuKxG/AJft5v/NIf/va3elsBf8XwFFYS9jjPppxg2434mFu1Rq
	WNluWAyfBOzyr1y/klkChwDx5oaDvJt9/wjFniSts0ElpV5HGQRjaiBehrtKpbfqYpM8JHF/SPL
	SdiBvvDJGtigj70W44TrMz/Pu7ODDqSjHEla5o0mDX83/rGocCLjhAbg0l+y/BDnyUELEKbvc43
	Ux2PtOHANuDs9SkLL1bm0X2Wy0+0bAtLwL1RCbuwLV++Nl6+V2xGvLv2CDUMnyQJlwzcIdzJGeS
	plEeG+LerMumm8mAKai+DZNmz2hhGj7pLMiFN9ll8eim1xtceNceDDKPeisGUAgmAT66Byr4LPH
	LCGqz8jGQ+VqcxJC+WkGQY=
X-Received: by 2002:a05:600c:83c9:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a1d764145cmr103633435e9.33.1792345039096;
        Sun, 18 Oct 2026 10:37:19 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm20128433f8f.8.2026.10.18.10.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:18 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH v2 02/24] man/man7/unix.7: Socket options: SOL_SOCKET is a level, not a family
Date: Sun, 18 Oct 2026 19:36:50 +0200
Message-ID: <20261018173712.27670-3-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018173712.27670-1-gnoack3000@gmail.com>
References: <20261018173712.27670-1-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SOL_SOCKET is passed as the "level" argument of getsockopt(2) and
setsockopt(2); it is not a socket family.  See setsockopt(2).

Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
Reviewed-by: Alejandro Colomar <alx@kernel.org>
---

Notes:
    Obvious terminology confusion, compare getsockopt(2)

 man/man7/unix.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 75e125c61673..1a94b00c6783 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -271,7 +271,7 @@ and read with
 .BR getsockopt (2)
 by specifying
 .B SOL_SOCKET
-as the socket family.
+as the level.
 .TP
 .B SO_PASSCRED
 Enabling this socket option causes receipt of the credentials of
-- 
2.56.0

