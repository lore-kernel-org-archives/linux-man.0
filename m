Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A269E582BB0
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171979; cv=none; b=UIcHeIEUYyPyzDQNVBs6EiPhXZ58BaLq9m2I/GAE+8bOFxEsJVIXgK9U7HsiVvqoyaXalxZGhzpa6MgUxJfRQrAXt94Ixur3MTQ2B9ejwcZCzJHu6Sx9uh/fPeTNtVJ8OtBtI0SaVCyO97vA5M4UPdPMm7oykDZ3187UpI32Zh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171979; c=relaxed/simple;
	bh=gcCV1Pj5lDziHHcpirYnZw22Atqulan4IYeoNv1jYG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNfU8wwIwQnLC8rSYg6uELbwhG7DJzQd85kIJvz8r9k4DQWeUJQZth3quzU0W7MI3EawVpgg/blwIuG8zGY+iykJrIdOfcp6sr3OA1OmZU5YU0fjxSKWV+RGe6wQtJPo+9J/bFjOrmPM3fgUZD0Ex2ydPpIuqiEEk9NYfIMUqjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4cq4NuO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4cq4NuO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso1093965e9.1
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171976; x=1792776776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SXQjrlq6ebELvh1qxZPvEitR/ulcwlVlys9yRKDr05Y=;
        b=L4cq4NuOW+ZW4MBBp06TlhgRYMH/B/ipqdMoSGY0CSt4qyY5QZEbf2upqIVQzdadBQ
         xPoLXl24Lb2xtBSZCM842s6dt528KJzUDD4VdFZN2EqoyXLsPkWwhmhthaLg/VfSmrVs
         WGH0QEdnmZ7t6KPg6KwgZ3iqTtudwEW3ImPYueJTP4QpkpBUlSSKXu0zLbxffSz7EUHJ
         tlUPIcq4W3JOBHLRP62bNBjED5oo1ucIugJIrN8snkGJnnyjOGNP0cKGQqxQDr7Ko6gb
         JhPjbgBdWUYwhpZGIeZa8kX+Wjx+FSlZG3DgMOFN3+wFmxmcelck43gk2p9sUncBclmq
         kEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171976; x=1792776776;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SXQjrlq6ebELvh1qxZPvEitR/ulcwlVlys9yRKDr05Y=;
        b=lfBjATWO0nvoPKSAOrxPlpo0aox0cKrSt4GY8lu+GqfwVZGcTZKAG9FHMFRGW/0xcT
         cqI7sGuv3JXumYJ75evnorYeSx+Ag5Ly3cCB4p1oQiM4hqH1BXydWbvfUYvOFdff/2XA
         lykco61U5o/RUjygf0w/Is3yfnHczFf5cXUhsaFXV6EbCSqT5co/VL8F+7dOSFhEFlhb
         UheGWNUi++Ce6r4UCDvn76er/kZ/p6rtTD/Otdzuxwas+0dElnYlRzo5Y80BpjKXbCFE
         8w0mMsQ8850Imr/+ZLt+BUVsWAqpaGgxQE532T0q2ZqA/vl7pdPAnhsnLABCCppYTjcx
         kLog==
X-Gm-Message-State: AFq9FYKLzLgK+jk1iuf6gkJt3YoGIw4eQT2LW+MVptSIOML8xyXO6vsU
	phUkFbepIAlgNCIPDEzqvQFRzaFNh8oXoyEtH+OtlKWupEtqS6u6SDjM
X-Gm-Gg: AYBFou3aamr7d8BfvwURXYFtDTeECEyuLtxXK8H0jifq8IakKaeRCnC9Rsw1eC72jBC
	xkQSyDnxeZ4/q6x9Dvus1xVApmsAFANwQkO1J4KRCVRXXrxayaOyaOrVXqRY6BWiy2xsjR9Xbhb
	7pNG/kXMYaDnESQ3Ig9UGZRdd0fl2zMSi2AqYQyWTmfxPCtJTRaZG4Lq7sneonpVNg9M1gbZLc3
	hr3KX622N/OcplCCe9N0XPBlQtkM6V6D2xd+CvyJXflyOCY+4TFS+a3/ft0SGjqcv2FOtgcnErL
	CKt1i+NojvH0sdukGflIWYICIw+iPCVFpDu/blFAjYTeIKrDm/MoxkGudNv9oQcQGAu3ax5N6Vt
	zFz5TtFs+Ihqr+7iGea6zp8L9jZ8BR35zr0llqkvjw1FcZs3QTLJGEy+wDU1xGz4k/EmwoGBcMG
	7N6VUH1H3BRwm09S9wuHUA/pEv6l4XF+NNsn5VVIRxbkBo7dNgN4lQFTvLThKxs5qIOyhunzIxO
	mtf9StteYZCDUaEJGQv30A=
X-Received: by 2002:a05:600c:1552:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a1d762a26bmr11000655e9.32.1792171975908;
        Fri, 16 Oct 2026 10:32:55 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm193535775e9.11.2026.10.16.10.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:32:55 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 08/24] man/man7/socket.7: SO_PEEK_OFF: This option is no longer specific to unix(7)
Date: Fri, 16 Oct 2026 19:31:23 +0200
Message-ID: <20261016173139.13076-9-gnoack3000@gmail.com>
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

The option is implemented through proto_ops->set_peek_off, which is
nowadays also set for UDP and TCP sockets:

	linux.git 627d2d6b5500 ("udp: enable MSG_PEEK at non-zero offset")
		Linux 4.7, UDP over IPv4 and IPv6
	linux.git 05ea491641d3 ("tcp: add support for SO_PEEK_OFF socket option")
		Linux 6.10, TCP over IPv4
	linux.git be9a4fb831b8 ("tcp: add SO_PEEK_OFF socket option tor TCPv6")
		Linux 6.12, TCP over IPv6

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

