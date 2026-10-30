Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793329182;
	b=MqfcaXJVPz/0ahrEx7K2UvczbAljQqYwla27fQRWkEFZexKdeqrx4gr5SKoUZYi9x2Kj
	 YGgGBvtp+QGPTY+6gMQvc/ONjMNUO06u7KWQ/beMDg9HLSoawT5Eh+19my25qTzOkIgzi
	 S5velNjjfXBmEFjEjnIY/8j1M4ICUg7OELeZZXQJy24WTBG6kLUbk/whkDLytErsWrZsi
	 kNJS7SPKEuaZvf3n8vRRE/zLjk8n6ZPQQ46QcvY/3qjG27t8KKe2Y3RT0oIvWtLXDPXot
	 eVsNdSylQf0JHxLD4DM86HwNYoaCfFd0pzqv3FtR6q/ULC/Thyu+w4L+X+jVNjQUYdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793329182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4CJQnPR537zpex9Ri/cJZz3u3S6oHIGIQT0QhWJYNsM=;
	b=J2NgF1TNLO2tqI1y60JMbgk6Mkx/55woChg8n+YbAaSIdKQKavIOHviEUGlzL/QpcHDZ
	 YWHZPXOa6v2JlgDgCOO/9lhWmwaJq5KmlkJ3rCOcowkZKKSFUT8RySlTFU50OKahj9o/M
	 g46Y5SlAVPSDOBvAfNmF+WORlrXynFLIPP/fUUfPxtI9cnBtpC979+a0CQYzQA/kK9X1W
	 qEU3YJhFYnRkkGPqndnhjuMmrkZhjYMZf9aoRvhsCswUAvwV7qaKdr5Df+FYmksSILUQt
	 Ss28TKPag3ly1vCjO8ThRC3pkbD3bIWk277DRCSxv8FfxQk63L4AIhBchH9bRIGVPPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xTQxhAdh;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E441606A320
	for <linux-man@vger.kernel.org>; Fri, 30 Oct 2026 02:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E441606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xTQxhAdh
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91c719669a8so2866786d6.0
        for <linux-man@vger.kernel.org>; Thu, 29 Oct 2026 19:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793329181; x=1793933981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4CJQnPR537zpex9Ri/cJZz3u3S6oHIGIQT0QhWJYNsM=;
        b=xTQxhAdhdOEKVrsOETP/6zrUFvfD/osFaXy0b2W9+Ak1KC9GyEdySEeOsQZmYL2jxK
         e61F2pZ4EpmgE7kJhZ+BUrfuKxb2oEpwFRKwz+2nVk1UF5gMdrPRXdYCAA4XJ23S1yIp
         WoepjOdxmOem3yh6c2iE4lAmR7/OE7+XeTpx1x6uk91xoFooUvbEEHZSFpx3dYljbUCf
         oK5FwoG1U5NrhaSz6E7kEDGvJIl+owKKILmBA5cHfmP5bsRnKKp1rgDNeGtAbU5DSgwO
         Q9ZDYG2WoQLxIOdSiUiE7EWZyRhWnS3bz0sKvbJ7PCFRFT1H+9nmvUnfC/N3ff6+BQpW
         BpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793329181; x=1793933981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4CJQnPR537zpex9Ri/cJZz3u3S6oHIGIQT0QhWJYNsM=;
        b=cxKABibAkRW5/EfqvAf/OBsfEje2RrEItVo5EqVo9kTkwZlpXBM/trIy6OFiFAhdeE
         4v1y0OKhm5LyL/Y3F5aTaghrnqWq6kjTOuvb36EirAtlwqcc2gR89BAR2riuUoG7mgFl
         D9+UW8KyVYZ5sa20QvS2Bx0Q1tiG7BP0rmHgnGlnaWQZPONfH9f7Usd7JuQE7LBCItSO
         bZ4A/Gf27sjdNm375Ay39/lPrZW+ZBdmHzIaJzdbZT8Rwb4DefrU6h6+l9LS4j5s7Tmw
         V7XYKbaHTIBNGQBBXY+Qe0KeyxZs7BDcaf0QgdbAjA9gnS5eX5SGlolwtjRMEHvOv5V2
         Kb3g==
X-Gm-Message-State: AFq9FYKzaZl/W2GFOJVY+aQ3qZhlkfCgU5TX8KPjAeXXnEur8vb/xDxt
	VndUOiWDkIO6+iqZOMO5qf03Q6rqO2HGW/fEDxfylqJyf99iEZGJF+tekhHCIfP2
X-Gm-Gg: AYBFou0wnswJsGPO+o1TeGVrjfitQBkJnlEapd71xzK2+3RBAhjVJXDc53i0yd0Dlv/
	Goq5iqb1G9Sy9jKdVzGlVBi/OXDDGi2U+uQqV/8oYiyQc3uZ2Wrnhz8bcToZt8MdoTRt8i33/w8
	VkbiiRRvOi9skzcHwk3i7K/hZmrv7dx73ZY6/URp1KTPzKhj/LwKFmHmGhJI/4qPbkn7q5RUoYg
	GbZW5AJMSkBBfqGqYEKrsaDHPQRDTCNlPQJOJ8SQomyP7A9/F/Q/L5ZxJtYMpFIdv0pk+IK4WPi
	QQ9YzGjeZ5mmrFYgWHikDV8k+8X46Cy8g/OyvA1SOiSeIYwIqTYa4+AwlqWRBmM5tOuFqfp+rPQ
	1nG0ZAjR/7pg4CsibS9/BgHT6IBpDud3WeEEyyVrZiXTJuDaWy+iFeFwG1f3tIWnQTArDaA8dkz
	iEa7JKBBVJo/1WoajeC58tCupNZif+9eVvsBN+Oj04LUccu6R3dsVofupLe5JFNIGqv0B6lXFx/
	pI1UpmfJtFmK7n5FQPEaVM4Pvx6NON9lqV7edQ9WmBQDVMdCYN+PFlt1HgiF7fu/o8M9KjBMUpp
	s2lpJ50CyJ2gaf24qlkGzQJjQv9TLwppHYSAf3gZciBKoCDhO0gsWtf22NC87pgoOAtcpWupcvW
	Oi4f9TbMc1Eq1iPiHqQ==
X-Received: by 2002:a05:6214:c48:b0:919:8681:20d1 with SMTP id 6a1803df08f44-91ca49f1aa6mr15093916d6.7.1793329180990;
        Thu, 29 Oct 2026 19:59:40 -0700 (PDT)
Received: from localhost.localdomain ([98.117.225.10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f25fc2sm3467936d6.10.2026.10.29.19.59.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 19:59:40 -0700 (PDT)
From: Chan Lee <chanlee031012@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: linux-man@vger.kernel.org,
	Chan Lee <chanlee031012@gmail.com>
Subject: [PATCH] man/man3/strncpy.3: Document lack of terminating null byte
Date: Thu, 29 Oct 2026 22:59:27 -0400
Message-ID: <20261030025927.37758-1-chanlee031012@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The lack of a terminating null byte is already shown by the examples in
CAVEATS, but DESCRIPTION does not explain the condition under which it
happens.  A reader who only reads DESCRIPTION may miss this behavior.

This patch makes this behavior easier to discover by stating explicitly
that no terminating null byte is written when the source has dsize or
more non-null bytes.

Signed-off-by: Chan Lee <chanlee031012@gmail.com>
---
 man/man3/strncpy.3 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/man/man3/strncpy.3 b/man/man3/strncpy.3
index 9c476acb4..89da260fe 100644
--- a/man/man3/strncpy.3
+++ b/man/man3/strncpy.3
@@ -26,6 +26,10 @@ into the array pointed to by
 .IR dst .
 If the source has too few non-null bytes to fill the destination,
 it pads the destination with trailing null bytes.
+If the source has
+.I dsize
+or more non-null bytes,
+no terminating null byte is written to the destination.
 If the destination buffer,
 limited by its size,
 isn't large enough to hold the copy,
-- 
2.50.1 (Apple Git-155)

