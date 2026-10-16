Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2AA58B6CD
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172011; cv=none; b=DjiuhvHP1dvtFbhEXx8wx99X1NMlr+OCN1H8I+z5TmNdSO/EXIfSJIRAzqnF0icdE1sboW3ZDgzjtm6yro1eHQ7vf7B2dZIgEyLmguwBvFioBmE3XtAYzLNcf3dnUIsbunCV6hQ1Rikp/tdAAsoqxX1c6qba+pE3Mg0PkXSTV58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172011; c=relaxed/simple;
	bh=gGY1Ob/ie5zqPYrRlE7DmnqXVvWjZZDcDFn6m9lm7S0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tkcug9qkHTkK4aaKmWeh/1lAJ3aRJagQVMEoD8aqHqhMibl4A1RxA4BllnliZrXb3MvCYX/tc7fb/B7NGUwwPFW2kJoM76SfQ1jWVMvtEKQEe5reFYuAaxYOlEfQPsnQKK9iNnai89RW1v41Hr08j2xCXqKf+RSHX6IuaOlR36Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZtRJziS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZtRJziS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso50868f8f.2
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792172008; x=1792776808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5IhGTItCjmDquRTpggw8F12EVEoCysQ6BLJVoy1p8GE=;
        b=bZtRJziS0/StHP1ouCx/LUC9qYuvDs5cFOBDxMjEAG/OdUPXkxmJ3rU5rzMvLrVSWJ
         LrXRAXPbWFDkegcNFyM0WKpTx0Fh0Wyn5Rnrx6B8scotE/buhLeKSUyYIB0uVghsjeJI
         gTA5K1+aVNvSc1kCbMyXbfDeqo/cxo97P+urTDBv34sPZ9DijZS9m0WnJOd8Vr13fVQx
         D80lXuLjG6HiklDkyt8ye2fWKYuC3VuAbUPvLnAlS7YpkLn1do1h3K/mG5V7+1QvOSK3
         E2VDTIY1z9q4VU5I7NaK4qi9wN6NVqNWQM8zPrl8BgsrGDnJEfhu/FfjyWEmvDgGGqzr
         uk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792172008; x=1792776808;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5IhGTItCjmDquRTpggw8F12EVEoCysQ6BLJVoy1p8GE=;
        b=Yu9Ow8PeHLmyJaYVns+Ohs46er7HjixlTbhJ6ayS1w+7bqOzTzEnzemgCj7YgaXKFw
         j/+VMiB+2CrKppOAIDWujO6oOlMzLM1CzdFraZiPhfpQUrvA4Oyg/dclegfws3kFmH+y
         8ldm8qCtTpz9Z2PeHhMHeNQidtgUNa4lZPL6EnpM2AaNp4teyx+cBh/Qw+jJSC3SM/3j
         7SiXtwRLse9snJE1O2vOUUP1mM0qvDVpzWLZG4GK+i4yUn1y1zj7aFjigE8DDT5QCC+R
         QdQw6tKByJmDAI40SyYfUzUw9+yddXPSq3G+2AwLquqy4xC6JNt4w7pq9/g2H1w+zXVn
         kHSA==
X-Gm-Message-State: AFq9FYI3bFeQfWNvfi7Be2N/MPO5gZZ43iBGmxK1T7IoUwyfKokdiLvJ
	vh4FVrsJyi1W0wM3un0tbxSjRHZhSvBBV1P9bgcvcCM0Rg6sA0ExVghF
X-Gm-Gg: AYBFou1jfzNqfNO3Ha5dJkmPWw/d8chHQQ7mDb6EqahHGk8efOlleLq698cYduxdYIH
	xIgIuYnIEhpl45wVJ7NErG6e2LOtqIqHo+LrI4884tk2Pg2ira8xg9c2PFqoDEZKPAoZFGpjQPe
	ps8GQC9Sbz8v4JUAuikupAYW7bHK01+B2Gb7JMHoWJXgzjQXcTWRYyeHX+/8YNbrNxtgAdFo69Y
	ogoGpOzronecnfmeQbSWpwcKrZeRpdTflG1EMfzfnJrCOsKpALEz4oZWDh94EAvKF2bi40qTvgw
	cZouJonnvRkbnsW87Gs/5LOdVihkUhT89g8t5BPwSy6oACBb7Jpm6tZpR5lZ1fGn2QFO/F/8UNc
	UaWTXGhvgP4GMKHl/ID3xhLR5EfvlQEhpATs9CFr577b8ejTy4d+v9bbONNCVNDkk7pk0KIH7tq
	7BJX7WbivYHXIN2P53GT07w+hDaQGnybpthKsXIJklxvh+p866hFeSR392vCCWi8ZCDY0pg4Qh8
	qpWDIFrYhx5qMXAqjjwi0ouv/s044Xgng==
X-Received: by 2002:a5d:6391:0:b0:48d:c178:f6e9 with SMTP id ffacd0b85a97d-48e07bbd618mr434240f8f.20.1792172007900;
        Fri, 16 Oct 2026 10:33:27 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471b06sm7233504f8f.5.2026.10.16.10.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:33:27 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 19/24] man/man7/unix.7: SO_PASSSEC: wfix
Date: Fri, 16 Oct 2026 19:31:34 +0200
Message-ID: <20261016173139.13076-20-gnoack3000@gmail.com>
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

Use "security context", as in the description of SCM_SECURITY.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 man/man7/unix.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index ff5a90863378..ca862df7cd95 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -307,7 +307,7 @@ and returned as the result of
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

