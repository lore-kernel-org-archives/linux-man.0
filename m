From: =?UTF-8?Q?Niklas_Hamb=c3=bcchen?= <mail@nh2.me>
Subject: Re: [PATCH] ptrace.2: Improve clarity for multi-threaded tracers
Date: Sun, 21 Apr 2019 16:57:04 +0200
Message-ID: <cea5f7cb-c6be-080e-3d1a-335da4b74b39@nh2.me>
References: <48bb7c89-abb9-1e88-fee3-fb42d4032d12@nh2.me>
 <bfa474c6-5b13-652d-2fd8-16b2be7efb62@nh2.me>
 <20190217221523.GA9233@altlinux.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OwGNQNSqQVOvD1aGOIshAm1E6dQ5YxdCU"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190217221523.GA9233@altlinux.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dmitry V. Levin" <ldv@altlinux.org>
Cc: mtk.manpages@gmail.com, linux-kernel@vger.kernel.org, cleverca22@gmail.com, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OwGNQNSqQVOvD1aGOIshAm1E6dQ5YxdCU
Content-Type: multipart/mixed; boundary="RkaQJYhghPjFx7gWx18EeWMq1qyJtc18B";
 protected-headers="v1"
From: =?UTF-8?Q?Niklas_Hamb=c3=bcchen?= <mail@nh2.me>
To: "Dmitry V. Levin" <ldv@altlinux.org>
Cc: mtk.manpages@gmail.com, linux-kernel@vger.kernel.org,
 cleverca22@gmail.com, linux-man@vger.kernel.org
Message-ID: <cea5f7cb-c6be-080e-3d1a-335da4b74b39@nh2.me>
Subject: Re: [PATCH] ptrace.2: Improve clarity for multi-threaded tracers
References: <48bb7c89-abb9-1e88-fee3-fb42d4032d12@nh2.me>
 <bfa474c6-5b13-652d-2fd8-16b2be7efb62@nh2.me>
 <20190217221523.GA9233@altlinux.org>
In-Reply-To: <20190217221523.GA9233@altlinux.org>

--RkaQJYhghPjFx7gWx18EeWMq1qyJtc18B
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hey Dmitry,

On 2019-02-17 23:15, Dmitry V. Levin wrote:
>>  A tracee first needs to be attached to the tracer.
>> -Attachment and subsequent commands are per thread:
>> -in a multithreaded process,
>> +Attachment and subsequent commands are per thread,
>> +on both the tracer and tracee side.
>> +Issuing a tracing command from a thread that is not the tracer of the=
 given
>> +.I pid
>> +will result in an
>> +.B ESRCH
>> +error.
>=20
> This is confusing.  What do you mean by a tracing command?
> Is PTRACE_TRACEME a tracing command?  PTRACE_ATTACH?  PTRACE_SEIZE?

I was referring to the same command as in other places in the man page, a=
s in the existing sentences

    Most ptrace commands [...] require the tracee to be in a  ptrace-stop=
, otherwise they fail with ESRCH.

or

    (for commands which require a stopped tracee)

Would thus "ptrace command" be better than "tracing command" here?

>>  .B ESRCH
>>  The specified process does not exist, or is not currently being trace=
d
>> -by the caller, or is not stopped
>> +by the calling thread, or is not stopped
>>  (for requests that require a stopped tracee).
>>  .SH CONFORMING TO
>>  SVr4, 4.3BSD.
>=20
> I agree the current text can be made more clear on the subject,
> but, unfortunately, proposed change makes the description more confusin=
g.

Do you mean "calling thread" is more confusing than "caller"?
If yes, what would you suggest instead?

My intent here was to, for anybody who encounters ESRCH and looks it up i=
n an effort to see what's going on, make clear that threads are important=
 here.

Or should I switch to `task_struct` terminology? That wouldn't be userspa=
ce terminology though, and the rest of the man page also talks about thre=
ads.


Niklas


--RkaQJYhghPjFx7gWx18EeWMq1qyJtc18B--

--OwGNQNSqQVOvD1aGOIshAm1E6dQ5YxdCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJcvITDAAoJEH/lIgaioOiYJ0gIALbn+rsRbApXNSZl+9y6GyHT
kOgocyW1akd5xxSzIgDRsshEsLZkJ2PD/u6wyvYbz+7NMPH5gFp3meIRKQgrtqZR
+ORnn9Oa6Lc4dlK1EfiSliEEooCpnhj/vihdkUt44t7qtbNEY8G3XmIZ0Wfo3Leo
7PatUwWNzwwvR29ZkNao7JC0gCMX5iSwXE5iUtSQEnitfI9PaYPSzylVqsboi7oN
zqNfedrL2cBlRg9yJ8kzOjG2qotuSssmPSj9UHQB88kxXro1nKhQvvkPKgfTtxxL
WkrnVdj7bAOf0/51EimZ/2whd5ssvuJvDINFd7lXCnW/WL0nvXrHTuLqmEigp7w=
=KcYI
-----END PGP SIGNATURE-----

--OwGNQNSqQVOvD1aGOIshAm1E6dQ5YxdCU--
