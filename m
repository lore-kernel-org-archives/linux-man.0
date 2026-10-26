Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049419;
	b=4NqYAAHoWG4h+je2/TjFPILjvwP05eG3IVF83FVTrkCA6DvHNTcQsW4QJ4Dtj5Ozsgif
	 7OEZnIJSMup0fYWoXc2G1XHfbiL+UGyviJKe/VG1sa0EfVPwLrrRw2bRJiWH1aoE/h77E
	 wuX7tLPxw7ENLJcRbao+h1nKdM07wysd+/79XJ8hPkL+mRXi87/MBE9S6KFQcivou3Hr0
	 BLc8HwlzRvzdgILCFBQjO1zSA153vODlrvcQh01QX6pyIJsbZvCvKB8YmY842fUpLByTm
	 fFlQNqsF4oPvft5Kz7O9hf+jZOJSArKowh80D84Od8e/2SnnXUIZqNvtIOBZ7vRKHRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ddH9TVAwZ/qmeHE2Ohu2jreZisqa1y0SkiA8oZZ5klI=;
	b=aaJtgsCSeUYGOfblb2nJE0ei6xH2t2ryj6aVV6fDBn3KdDJ/vcBGzlIiBDx6AR98M/0P
	 64gP8pdSndJ7bypqYAqfYDnN8RrAmGHoa9sMTf7CuH5aqHiFwWWLTu8kfozx0iE1rKiuK
	 1pJqV+tyNIP5K0ENqaWg+UBkVUH0RCW2LzWjS7Djf+egbHxzq+6uxsWCC4YlndJvHXMQl
	 1tx3iXjEqK+jmWCYOvnjc4wiK0SPDXQXtBCfN4B+4jS5182+A9FXTvAihWsCqP2e2nerj
	 KAuDU777VXGvST3ngKoBu1tmaQp+X96HLkuQ/OPWZbNXesOOt3Tm1zc62OOSjMzVnPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qiu27mPp;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E6D606A31A
	for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 21:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E6D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qiu27mPp
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so14176155e9.2
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 14:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793049418; x=1793654218; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ddH9TVAwZ/qmeHE2Ohu2jreZisqa1y0SkiA8oZZ5klI=;
        b=Qiu27mPpZdTNF3RqRFZml2wyKIM2NSAJ+M4y4SBPhWRosjdBTIFrXMzsvvVW08IHye
         ZzDQ1TzsvfYffyn9xLuVB2rdYcBmii19mlOpoEcOUTmWr/XW+AIUhJW0e4t0YHY1oR0S
         N1tlmp6z6FpcPOffAfpIRZZlJnW9OJVqhOKB7KVVaKLqwGaEByn7pZIrOJQuClDfY6aC
         yJJ3xPyZ7EJSA++jbcIilWTEGh7UO5AHRMc+eynuBlpF/xIpzWeoDo+fo/veUk1XvQkN
         GbtHA2PN1NXTYP9h+dU8zxcvAW8Go1goP+gESIRVyQ/nMAodkpEI2ZPoywPlaWMddKTz
         mVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049418; x=1793654218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ddH9TVAwZ/qmeHE2Ohu2jreZisqa1y0SkiA8oZZ5klI=;
        b=wUedOyxHpootX3M31erLKmJS29xRXgIDPRYyAhyLEfdiz0clfoTkTnOQkESWVW7r1/
         +YnSVKovX6HL138MEcj5S5skwEUMS1D4W7nMQR5iaqQsfWJbj4UimGCdowRW7E+mwfC1
         YqvaoFz8Yqy/hwmPPFs7vhz3hGVdB4JRK+X3wplGNUrkTV9ETqS0rHlFYwhLohPjhqJI
         3bw3IDRBtqTSgAXKUd9wPV2H5DSlI2xMUcmm1Ho3YwB+ZT2GfSMeP2Raw37Cakx3sz8Q
         6o9PlLVw748J0zxTa6zwBzyhvpLBbqAbHj8ADfhu8KDhBsjBacn7VmhEiL0POCQXlQL8
         fa3A==
X-Forwarded-Encrypted: i=1; AKwUvByLg8suZ3N52Q9vpmTStGDLjGZl4zJS90nL9Z6iTmprtFde8c8zy9NOtuRYsPkI+g4Ou7vUFBMGtZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF0SguW+WRUGbvT7QvUJhlO5xcxUjVfefCVnJwpPmMWzf4TK+O
	sy5nl7dKZNcEgAzLKhpgsFyNULkHyGwhIPoHWWE5nvwCCk/I7L2Iwn25
X-Gm-Gg: AYBFou1zZibxqa9GRknDe6rvqf2JJOoGBHFgaKN3I/fz7TnnAzHp+Kmbp3I/fmXxwCZ
	fGw5OYa7Rv3Smd4ebWqgWwBJ0wsE0tQ8jEXOcp5k2cPuO1SOWxUZoWwVDfpIgBoytHYQssPeRPd
	dY0WUyJtEToN4dRx1Bi2zh4yv4OAYVKf7dVRqetzjPbuyDOCv2oim4Mb7hNbTOhHNmNcbMVswdO
	FteaHihtvkJOk651/ePWNEDNTZ6GIZ4SzAEzIsoVPrOHhEyrC01gwq27phyFZQORpUKzYA6vU9q
	ublVE+ex7odnwlH+HOV49mwYOn2Ko106YuJIdMeuTWq3Q85BNeOn6V8wzOBjHwmdX9rJdvCafwG
	EA5ceI9tT2eTeKrLd0Isw1Eg4EVmOAtI9XOo6KzjS5jsUDIfkdl2zz1W99IZhu+34sH1pKo+j7y
	tSr+O1WWB/urgdbySwmxP82jXFuDle0bBLOPLB6tzi5DKNdakCoFrBwVEbztJnt0ZL03HxXH+A3
	JenmtHmyA0jdU18kDPQzujOpuCUtWgWnRqhEpI6vccmUBv0nqN5EgE+avHCjqqLtlHljJCQISBs
	7SuR
X-Received: by 2002:a05:600c:474a:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4a35ac91f2amr158453395e9.16.1793049417633;
        Mon, 26 Oct 2026 14:16:57 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4be6sm16928533f8f.37.2026.10.26.14.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:16:57 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:16:55 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH 7/8] man/man2/bind.2: ERRORS: EACCES: Write permission on
 the directory is required
Message-ID: <20261026.4ccd417dddaf@gnoack.org>
References: <20261021210800.27338-2-gnoack3000@gmail.com>
 <20261021210800.27338-9-gnoack3000@gmail.com>
 <atxIngnsKw1c7ngn@google.com>
 <atxI3quJcWK4dYXE@google.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atxI3quJcWK4dYXE@google.com>

On Sat, Oct 24, 2026 at 05:58:10AM +0000, Kuniyuki Iwashima wrote:
> On Sat, 24 Oct 2026 05:56:53 +0000, Kuniyuki Iwashima wrote:
> > On Wed, 21 Oct 2026 23:07:59 +0200, Günther Noack wrote:
> > > In addition to the search permission, binding a named UNIX domain
> 
> nit: s/named/pathname/

Thanks, fixed.

–Günther
