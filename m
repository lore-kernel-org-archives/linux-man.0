Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B4B58E2DE
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171961; cv=none; b=LPnHhtkaEo6ICUS4MkcBFN/c9LJPgKfAxC4rL0zJxpfXDP8wuVXkHyOF92Bf/wcSaggovZBvU5PKXwLZCznc0kqRz3HprkmJLp5mCGpZreUomDx5XPIl9U6siGfXBcwiaPYX28FgI4P8uNDk+t4BYdaCjVDVBMKgKfx/2HaayTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171961; c=relaxed/simple;
	bh=+FhdnRMcb2dLED2KlzV/YGDZrsrz23dk3xfE5EJFZAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gOzsTDYzXjgFZzlfx+Nbfk1YPQLPvIH55GMjWgZmfQzsMuhatiWBLjBog4cJfm4tYsfqGHbWIyCXBGKEdbjXywTdX9FpeiEWPVPYQFZpOuVaIuDTFIuviCG4N/QnJAtk0rkAAneGhStW22JZLJZbAoapdSgiGw4xPSuTdsZTp+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOkkM0by; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOkkM0by"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so2364225e9.1
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171958; x=1792776758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xh0kzSBFYxraf/V9+TUFQHT2s9uiPbRN9sruE7LKIfU=;
        b=QOkkM0byWAxHX5Zy6AVVYjPqiqCrR1UUhHclQ/kn7vArS7ui+8TYkY0jynjFyfLn1P
         eEWGtawUMFhTAwLAorWL9Ie5nEYjt0hozMDg8WEBvyMyYN5XFRjyUyRA6szK1sSzN4aN
         AkxWMIuv+tw2LBj6mp1ZYuC0+bVDniJOaYH2zlLrB0tVr4GSdN9pmMGDWv21pm/3eC9e
         tkCc4pYGvZJIgSyShu2u3SBemjbJqYUquY+H6TOokFXtOzcN1gGLTsH9GFsRw85RuNuH
         pTmEXGXdgAo+pwvMn4LO8uvOlNeOrI7VTjhhv1UBGu/6DX6UYDcmu4qkXdFjODpErgcb
         q+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171958; x=1792776758;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xh0kzSBFYxraf/V9+TUFQHT2s9uiPbRN9sruE7LKIfU=;
        b=ojEtrILKr7V6hM0PSr6FOMElfIG3Y7Z5i66KDjAW+BVA6PPIAq3SyIbf32m9NhUena
         8xAQFlu9KUNVm4Rt7Oa7QDvqdadEGKYxRbbR9sHiP6TQW2KgIL8x2DZs0dHJw8qyjh8y
         1nm2jg0ZjrhTJroIvWi0OFSbE+A2hFbTx/+0vZ/trOrjW2UFa7MrwhRzFss4zfQsiRr7
         GJKbCC2Qh+wNUbh++fL8NNVWLu9AJpKx/jWQY7JfqP19ya9KRoj6ZQ8LDZ4l7Mo22UD9
         8UqevFXMF09VwcefomQlTTsCLyaC7Qa2Y/H7WnYtRdKku+mNEJKey21HJo3PxwOM2E/E
         EC4g==
X-Gm-Message-State: AFq9FYIBL5yC/MIJmar762zQ/Lt1JXDJBVrqA6jIuCLNvUpcnKl6Ukgn
	05IWPC9+Gni9/BvlceXgMfn5NNtKps8RtaDaYR7XcAulfojYgOOa0exq
X-Gm-Gg: AYBFou3/DgjW09F1kj9bfQ5elQbwM34N4SmqCgnXT/GYnGj1swS/rK5Rw0utV1p52sl
	vgWKYapFaIaLdiIiUIh1Rzd2OGvUN2yC2H/MLdgHPP48KIbep1m69wVZLmJAqpSjg3kpyDRO5dv
	l39flRWhfsMJhmIUK0C2m3DqELR6bWN2KrGBIsNlcrkhl+yoN8JVpzhvcmZK1EdUVsumDrHsbv5
	7r1UMGYpTjUy676hA44fiMJJQC2gewAcGdv/XgW39+20s8kuAzjlypGzJEQc2xZ0Mdmp3jVoyPH
	/E1elG5vFIRlEqYfMZBc3w29YG7ivS/PIFFk09udslZAnZy4zIzBGsE4i2qQgSSSvmhZEZFAtPF
	y4YCJ4tL6aKMP6shfV3czeLq41t0cOUE5nKkD+gXz7RLKXXMuYBoc27F8zX0znD0FG/YQMO8Mch
	zxHqC5s++JZk3oT3MgOQEfWuwOhF6de3Ch35XyytgGftBtxLukTGHYgcZkoK/Tcg/QV8Sxfr+XN
	ejDxcNZulWlebr8QHRJlw0=
X-Received: by 2002:a05:600c:840c:b0:4a1:7e1f:21bc with SMTP id 5b1f17b1804b1-4a1d760d292mr11300725e9.29.1792171957901;
        Fri, 16 Oct 2026 10:32:37 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce02d619sm44644775e9.3.2026.10.16.10.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:32:37 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 02/24] man/man7/unix.7: Socket options: SOL_SOCKET is a level, not a family
Date: Fri, 16 Oct 2026 19:31:17 +0200
Message-ID: <20261016173139.13076-3-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016173139.13076-1-gnoack3000@gmail.com>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
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

