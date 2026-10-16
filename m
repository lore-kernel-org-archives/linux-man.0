Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA95957EDA2
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172016; cv=none; b=ccYyMYB8OdP+3+L3CPxqn9dSo/ywp049NqDDTLY9P4tp54AEn7J96ssqbh6VOdaEHSH4/b9329IOmdYl8P34MM7pYCwqLABNtD3kqq4mnR7z/gVyaLG5qOeapR22a7RkqK/8mO/pYYxXxfOJBc41fzM0g+Sv5xviGbnDQo/hd4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172016; c=relaxed/simple;
	bh=63XVzORgwquECplTtRVQndQ7e0+VSOaZKUx2hNV+Wi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=StAQvn+CkMPXY2L5Xki1VFbumeZuJxTIkqbiMlPk5ey0XkEUndaRnnHuAT9Gt7sW/TcrZVe6QwTtyYSwjI6/+aT/vqB2k5feryzN+nDCoSpG7SLyx9wObatyfC6dsYLgyp6ucvs7fmC3yln4mOozgBSwVIWQ5zNmXKr6I9zdjos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQBGpUvj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQBGpUvj"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso53426f8f.3
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792172014; x=1792776814; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/NAs4UEQnBIr2HxH8q8R5oZC5JcrfxQIB5kFE6aIIE=;
        b=pQBGpUvj1yQCPXM2av12aGFkJMVPjjfh10FZqX1AfT6azc85zEmGhSQgait+wpE289
         HY7oX1CIg/BDiUxfd0kG4z62XBsN94+CHb/Zgle1JEvi1gNPD1g5YnlwuJ4Qfn23V+8l
         NX6KPF7DOmUqQ3Ax1SkQRXsqK+nT5iMCXSzghqIfoiBzEPlqxhtttdvKTXDdst3kj6v9
         Fuvk0n1OVzq8D/EL6aXuma/EF531LOmu80GtBn2lyv4+Q6eEqTMP0fylQWiIQZ2ERTXu
         Vu4zUNoD/6nMyvF1VcOeWIgbbGTZ/ijtAyDMT7XjQ80y7Od+6MYjL7NsQbj84lgNhqAe
         iJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792172014; x=1792776814;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/NAs4UEQnBIr2HxH8q8R5oZC5JcrfxQIB5kFE6aIIE=;
        b=CJwli1h7xtH47wK56O7yft/U+jXQRjDOLw8Dfkhr7Do7b6Qd0SekypdLq55MXV97lH
         deFFaCYotCnvrJ0DeD+wUAmWxS7nGCfG6mEU+EU6QUGc4ubV0Oy37dkl9glE4TzPqCPx
         tpL4vxNRGYTW5iur6LrW738T5MwR62Dl4neI1/s8m7zNwO1B0E1PbTzBtPsv0Dz1jmS1
         0upIvjtL52+aTXaUHo0rCgD25saxd3m4IDm8ac9MASZ3xgGEh5/hrkpSs516zJF4KU2X
         jxmWvvcMs4Gkt2JDQ6Tx7ipGekLha+CbNtLl3zJuKxHjotuZJIyyGSr4cya8t52W2PRj
         6h1Q==
X-Gm-Message-State: AFq9FYKwljoRk3sd7SDlDj20nviRYFuA3bpS4HY3YzcaKTaeYUsB+gSD
	bNM1cBtL/PbGqrAGFZMPdP7+CqaPbi8aoJHLxH1d4uaDJIY1yW9QDh7Qm2pQ7+/Y
X-Gm-Gg: AYBFou0huuSOTxfjA3prItrlg2WLcxfrHPeI+nh5LFihcFgJUUsfKfBulexNPGpBnDZ
	0gjNuvt4mjyF3Mzrvtv4ZJcAdA1/Mtw7kkO2qzmah7WDIijJmO1zecRuDxwcRjOrWVDGSykR2nN
	57EEs16148uGFJN7wOENKOl072toxHE+lyVwOur7deAwtfbgOscDH0rw3dDqe+1h/xdneBMqktD
	qKmPcRnP4nM6HZG3iabNRabR/eGQUmuUOvW9xr8zzulF5Dmz7w7CF97sW8j2d5HiFmS5JJg/hXA
	zraQ0qPBJOSKv1QmCSdWMuGFN99Xxqcnp4kUKFWjgMHjlSIs+juHNWRnmHyD5NIEnZS3c0YdtM6
	NY8D0DR1maLRm88cpnpOgHrTraiAEGL0HpnDVToankviJFLPeMx+3BSEKuSL/MSOvwEKqfg1RgQ
	FIdSemfTCVXENVzoOFXK0+9GiEVEztDIeVK6CgmzSjLKWOuvC40s+5tOhAuKkrlWxYgloKaIpWh
	pS10Ix4/jU9/gxI4mSio+A=
X-Received: by 2002:a5d:534f:0:b0:48c:77e3:6c8e with SMTP id ffacd0b85a97d-48e07fba0a8mr438696f8f.49.1792172013882;
        Fri, 16 Oct 2026 10:33:33 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e28bcsm6419891f8f.23.2026.10.16.10.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:33:33 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 21/24] man/man7/unix.7: Abstract sockets are scoped to a network namespace
Date: Fri, 16 Oct 2026 19:31:36 +0200
Message-ID: <20261016173139.13076-22-gnoack3000@gmail.com>
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

Point out that abstract Unix Domain Sockets are visible within the
current network namespace.

Abstract addresses are looked up in the per-network-namespace hash table
(unix_find_abstract() -> unix_find_socket_byname(net, ...) in linux.git
net/unix/af_unix.c), as network_namespaces(7) already mentions.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Verified in code

 man/man7/unix.7 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 47f09f16d024..8d1a53948f5b 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -262,6 +262,16 @@ has no effect on the accessibility of the socket.
 Abstract sockets automatically disappear when all open references
 to the socket are closed.
 .P
+Each network namespace has its own abstract socket namespace (see
+.BR network_namespaces (7)):
+a socket can connect or send to an abstract address
+only if the socket bound to that address
+is in the same network namespace.
+In contrast,
+pathname sockets are not confined to a network namespace;
+they can be reached from any network namespace
+in which the socket file is accessible.
+.P
 The abstract socket namespace is a nonportable Linux extension.
 .\"
 .SS Socket options
-- 
2.56.0

