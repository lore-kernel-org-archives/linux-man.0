Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5428158E2DC
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171966; cv=none; b=rcpDrrVGlBBz40FtccOE2I3XrMpI8T385Q6NvVtjv0YXgugRuWT8EZOIIs1o+HDITfEqk7hYtJUpMZB2SRmJlXL2IYwrVAdp3l2oUqc1rbu2Dp53HkaruSv0MihkSGsZKHC9BmyNufilaqoerrcQ/c51VJzFbrHRiV9qb0uBQEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171966; c=relaxed/simple;
	bh=BSyUsGVU4xnXMev8kDKFDwEuBmo7JVdepC6oeps0lEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m7jds4DkYSAaTapVpVvY8qRLBy4ItTvKiKZPIBqPuTSeYMvWtx+gpCUIopqIX5cU6t6HXOTDJaTzXHNxxkfMga+s2bGvP85rCI02MEvxq6Nu4tNBokr72xSIL/LsCpFj6cIkA/8nwrvIGXJowg7PjZ90xGYT96QtXTIxpnXhcyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFQGwNu/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFQGwNu/"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso52869f8f.3
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171961; x=1792776761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l63CjNh8JRTWqoQIOKpqMtiUWoJETP7/J2DwuCnj7FE=;
        b=lFQGwNu/f1/Qf18r9AuS8PQ6ubx4np53RJUBdaic1+48fgIlMaMHCKDRXwRJVCjLi0
         mN+CxsVAQ+ynuynSFe6Cx+1I64ISKHLZvAXWC/rpoTOBkUafOH8/6N17Sk96L5sGYdAD
         /oed+l8tXRhR+tN2yNIBywp4Vc77vZ03ktPO/WG+bVLUtuyIbTj8dR6hB3viRqhB+BaY
         x9OB4W/MHG/PFy6+MBqsTz/r3FIvL27hvMw5mh5LIkGEDkp5yGfS2Af5Ck9EWBdv224a
         vxEYBbuNYG92HiXycm3msyNqknGn8W/xfhqqr9O+ggCNcArXu4yQfAAuC8mmXGGz5e8A
         Alow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171961; x=1792776761;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l63CjNh8JRTWqoQIOKpqMtiUWoJETP7/J2DwuCnj7FE=;
        b=tmK0DDPXgESgkgmhEtDzuJCX2A3RSNC/L94HvvwllUl97lFWiY4G5hTQZvriQZu3Wg
         XG95YgPhGOFT0BZc+9gASZbg08Z6+zUqcuJLGBmPEM/gZLCKX5DHuidnK1Xu1agd5ZOI
         kxs++2TQyh5KQdJ1Mgx/XnYm9XoluCoIP249KbfPAY1tWH4lO41wuZfC4JjAKDsGarcx
         n0DK/Ll7M5fwehMGEPVDImCGdwXlJAzqO3kfAL9RfNNDy4GZvZrvFLOoWTAix93IBc4X
         hN0fG8u3bb6xA93zPAIjs862KPWnZfNZE8B/Q2csnsPVPyBDof9clhYvoWRiMhPXqfQ4
         iWIQ==
X-Gm-Message-State: AFq9FYJt0oghy2IwhWhiQTIZuGY5PVmbrPL/QnPXRT9Qe3n/0eSTV9+3
	I24+IGqA0qe8i4a+TI2z3EWymD2zUF7A608+Rf8y9J6QmJF8ZY+qiJbh
X-Gm-Gg: AYBFou1o1vWitso70WDrHX5TTDwlLS4LQDDHdv0CJDF0yMQF50Jatlv1ZWpAUQ09f+k
	3DC5EV+vpWP+mHM0vP6Cy1/P9z9QEOS1vIUcMCSRQch1dt04dRjTQKJPxsNrs4Y1O5IOfyPlhm8
	lSEP33H4HWXQW9CvEZKui5QXxTmEeqVcswyTLPg4UsVDlqk/6D+KgX2n6gkiUV9VS6uRpSh8WxR
	FX5Fv7L33VQJgfKURN+BM3ssG1jykEtOTqkMQD6jHwBDrzGbFxq9C4Uzpn3H8FJBZ3n1nh0XRDn
	8c3FJhsKsUnMU+zfs/egCxuwMk3Y63U+wCJiHkEGcwgjZ/o53JH7DwZ19D435BTDcwMFY6ci8Es
	6IqHzZKyVy0rN96ui/jyYSnNp2WLQeHP6qoK+I+pI3pw1CFZA675uNUC/Haioxo5zPHrpyzu5rw
	YE5UsJwH2HiUoY4qEyGSvvlcFm3Vyz6TukCiMMpY9dtIY3/kkQvbGY+L2riTaMiYOYY3Lsx/+l8
	6RGt3EphL403V8TOexmgpM=
X-Received: by 2002:a05:6000:4eb:b0:48d:f02c:eb68 with SMTP id ffacd0b85a97d-48e07bc4e8emr411186f8f.10.1792171961067;
        Fri, 16 Oct 2026 10:32:41 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510c78sm6262483f8f.57.2026.10.16.10.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:32:40 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 03/24] man/man7/unix.7: SO_PASSCRED: ffix
Date: Fri, 16 Oct 2026 19:31:18 +0200
Message-ID: <20261016173139.13076-4-gnoack3000@gmail.com>
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

Only SCM_CREDENTIALS should be set in bold, not the following word.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    This looked unintended.

 man/man7/unix.7 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 1a94b00c6783..1054d7f52a30 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -276,7 +276,8 @@ as the level.
 .B SO_PASSCRED
 Enabling this socket option causes receipt of the credentials of
 the sending process in an
-.B SCM_CREDENTIALS ancillary
+.B SCM_CREDENTIALS
+ancillary
 message in each subsequently received message.
 The returned credentials are those specified by the sender using
 .BR SCM_CREDENTIALS ,
-- 
2.56.0

