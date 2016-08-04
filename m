From: Sloane Bernstein <sloane-Fu4SeaK3EASsTnJN9+BGXg@public.gmane.org>
Subject: WEXITSTATUS() under wait(2) has ambiguous description
Date: Thu, 4 Aug 2016 07:55:36 -0500
Message-ID: <DED29858-0AB0-4BCE-A80E-998C67542001@cpanel.net>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: multipart/signed; boundary="Apple-Mail=_1BFB4BB4-C4C1-4076-8668-5B3F4100EC02"; protocol="application/pkcs7-signature"; micalg=sha1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--Apple-Mail=_1BFB4BB4-C4C1-4076-8668-5B3F4100EC02
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hello,

I believe that the description of the WEXITSTATUS() macro from the =
wait(2) manpage <http://man7.org/linux/man-pages/man2/wait.2.html> is =
either incorrect or very unclear:

>        WEXITSTATUS(wstatus)
>=20
>               returns the exit status of the child.  This consists of =
the
>               least significant 8 bits of the wstatus argument that =
the
>               child specified in a call to exit(3) or _exit(2) or as =
the
>               argument for a return statement in main().  This macro =
should
>               be employed only if WIFEXITED returned true.

The system's headers (it's a CentOS 6.8 system I pulled these from, =
IIRC) themselves define the macro as:

> # define WEXITSTATUS(status)    __WEXITSTATUS (__WAIT_INT (status))

from sys/wait.h and

> #define __WEXITSTATUS(status)   (((status) & 0xff00) >> 8)


but a simplistic reading of the manpage entry seems to imply that the =
latter definition should be:

> #define __WEXITSTATUS(status)   ((status) & 0xff)


It isn't, of course. When the manpage refers to "the wstatus argument", =
it is too easy to associate it to the argument named in the declaration =
of the macro just above, rather than to the single argument of exit(3) =
or _exit(2) (which in both =
<http://man7.org/linux/man-pages/man3/exit.3.html> and =
<http://man7.org/linux/man-pages/man2/_exit.2.html>  is actually called =
"status", not "wstatus").

Because both exit(3) and _exit(2) only take a single argument, I would =
suggest striking "wstatus" from the text of the explanation of =
WEXITSTATUS(), since it is not ambiguous which argument of those =
functions is being referred to.

----------------------------------------
Sloane Bernstein
Technical Analyst III
cPanel, Inc.


--Apple-Mail=_1BFB4BB4-C4C1-4076-8668-5B3F4100EC02
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJ8TCCBK8w
ggOXoAMCAQICEQDgI8sVEoNTia1hbnpUZ2shMA0GCSqGSIb3DQEBCwUAMG8xCzAJBgNVBAYTAlNF
MRQwEgYDVQQKEwtBZGRUcnVzdCBBQjEmMCQGA1UECxMdQWRkVHJ1c3QgRXh0ZXJuYWwgVFRQIE5l
dHdvcmsxIjAgBgNVBAMTGUFkZFRydXN0IEV4dGVybmFsIENBIFJvb3QwHhcNMTQxMjIyMDAwMDAw
WhcNMjAwNTMwMTA0ODM4WjCBmzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hl
c3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxQTA/BgNV
BAMTOENPTU9ETyBTSEEtMjU2IENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWls
IENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAibEN2npTGU5wUh28VqYGJre4SeCW
51Gr8fBaE0kVo7SMG2C8elFCp3mMpCLfF2FOkdV2IwoU00oCf7YdCYBupQQ92bq7Fv6hh6kuQ1JD
FnyvMlDIpk9a6QjYz5MlnHuI6DBk5qT4VoD9KiQUMxeZrETlaYujRgZLwjPU6UCfBrCxrJNAubUI
kzqcKlOjENs9IGE8VQOO2U52JQIhKfqjfHF2T+7hX4Hp+1SA28N7NVK3hN4iPSwwLTF/Wb1SN7Az
aS1D6/rWpfGXd2dRjNnuJ+u8pQc4doykqTj/34z1A6xJvsr3c5k6DzKrnJU6Ez0ORjpXdGFQvsZA
P8vk4p+iIQIDAQABo4IBFzCCARMwHwYDVR0jBBgwFoAUrb2YejS0Jvf6xCZU7wO94CTLVBowHQYD
VR0OBBYEFJJha4LhoqCqT+xn8cKj97SAAMHsMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAG
AQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDARBgNVHSAECjAIMAYGBFUdIAAw
RAYDVR0fBD0wOzA5oDegNYYzaHR0cDovL2NybC51c2VydHJ1c3QuY29tL0FkZFRydXN0RXh0ZXJu
YWxDQVJvb3QuY3JsMDUGCCsGAQUFBwEBBCkwJzAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNl
cnRydXN0LmNvbTANBgkqhkiG9w0BAQsFAAOCAQEAGypurFXBOquIxdjtzVXzqmthK8AJECOZD8Vm
am+x9bS1d14PAmEA330F/hKzpICAAPz7HVtqcgIKQbwFusFY1SbC6tVNhPv+gpjPWBvjImOcUvi7
BTarfVil3qs7Y+Xa1XPv7OD7e+Kj//BCI5zKto1NPuRLGAOyqC3U2LtCS5BphRDbpjc06HvgARCl
nMo6x59PiDRuimXQGoq7qdzKyjbR9PzCZCk1r9axp3ER0gNDsY8+muyeMlP0dpLKhjQHuSzK5hxK
2JkNwYbikJL7WkJqIyEQ6WXH9dW7fuqMhSACYurROgcsWcWZM/I4ieW26RZ6H3kU9koQGib6fIr7
mzCCBTowggQioAMCAQICEQD80Dmi8+sruHTe8Wxh1j+/MA0GCSqGSIb3DQEBCwUAMIGbMQswCQYD
VQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRow
GAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDFBMD8GA1UEAxM4Q09NT0RPIFNIQS0yNTYgQ2xpZW50
IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTYwNzEyMDAwMDAwWhcNMTcw
NzEyMjM1OTU5WjAiMSAwHgYJKoZIhvcNAQkBFhFzbG9hbmVAY3BhbmVsLm5ldDCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAJgyjutoS6exbKipRKY/Tnp9G7n9TlrOsYx04bkN8dKQBWrx
tjuGwO/dDfIk2IUJ3njciFfdCqydEN3VB/9QaDjvSJHBYb+w/N/rEmdLjnkNG4xvKKpr3QtsxPdv
rEi+YxSt2s0Vl52J79UeBEUn7bnFsAfh9cnWKz+kguMROfQlaLsk5q5utNlFVx6Xp5LdDBOFSs94
K8l6k/97JS7FrOU7FPrXNPqNcbDmk2LssCxC4n+88kF1cHi8EiQhxWMvUooXSuYECboZuTfmBFGO
IONu+ezh4x9bSUhA5reUKNlbVwkrQnES285WBQmL+uUPfiHwb53MDnJ0ySRi/dXUsEUCAwEAAaOC
Ae8wggHrMB8GA1UdIwQYMBaAFJJha4LhoqCqT+xn8cKj97SAAMHsMB0GA1UdDgQWBBRxk+kyxEhO
YC1Hc3PeEl5V8johBTAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAgBgNVHSUEGTAXBggr
BgEFBQcDBAYLKwYBBAGyMQEDBQIwEQYJYIZIAYb4QgEBBAQDAgUgMEYGA1UdIAQ/MD0wOwYMKwYB
BAGyMQECAQEBMCswKQYIKwYBBQUHAgEWHWh0dHBzOi8vc2VjdXJlLmNvbW9kby5uZXQvQ1BTMF0G
A1UdHwRWMFQwUqBQoE6GTGh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0NPTU9ET1NIQTI1NkNsaWVu
dEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgZAGCCsGAQUFBwEBBIGDMIGAMFgG
CCsGAQUFBzAChkxodHRwOi8vY3J0LmNvbW9kb2NhLmNvbS9DT01PRE9TSEEyNTZDbGllbnRBdXRo
ZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5j
b21vZG9jYS5jb20wHAYDVR0RBBUwE4ERc2xvYW5lQGNwYW5lbC5uZXQwDQYJKoZIhvcNAQELBQAD
ggEBABLP57IpThcHXGlROX4On+K00dFts3pT7Hz58RiSFtFokQc8VoPu48D/L+hLNSxIJc7SQJiy
YYhLS9qXRKaBIdFiowR3Is66syZNNmubAOaVzYKn4X9piEh/o/QmzFR8bjNt7DO32t15EStEusKP
S1JWUobZcxVQ6o+I/8mkX13+49Unriu6W0vSrVfSxT+48LtnwRW610iKiewjyOPWTR1cGFDD/EiG
VyfJ4ppx5ysn2TAYsFTaZt/AAWzvPkQog79i+jQ/bjIK8j088ysPga95RnT658ZuyjIgVsKNaMyC
xbjne2lRtQ7gKAl6kBOFKPdvT2Hi7EafIRtXSLmtEhQxggPGMIIDwgIBATCBsTCBmzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxQTA/BgNVBAMTOENPTU9ETyBTSEEtMjU2IENsaWVudCBB
dXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA/NA5ovPrK7h03vFsYdY/vzAJBgUr
DgMCGgUAoIIB6TAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xNjA4
MDQxMjU1MzdaMCMGCSqGSIb3DQEJBDEWBBRd1ZeWph+7BWbtvviksDGQKDoWzTCBwgYJKwYBBAGC
NxAEMYG0MIGxMIGbMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAw
DgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDFBMD8GA1UEAxM4Q09N
T0RPIFNIQS0yNTYgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQD8
0Dmi8+sruHTe8Wxh1j+/MIHEBgsqhkiG9w0BCRACCzGBtKCBsTCBmzELMAkGA1UEBhMCR0IxGzAZ
BgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09N
T0RPIENBIExpbWl0ZWQxQTA/BgNVBAMTOENPTU9ETyBTSEEtMjU2IENsaWVudCBBdXRoZW50aWNh
dGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA/NA5ovPrK7h03vFsYdY/vzANBgkqhkiG9w0BAQEF
AASCAQAcckNKQbiY1evF1jNQbLy8/yoYtVQjYumLEkLl+80MF3JFKLpIcyqK1PnsylxKYIOMzT+h
MsKfOblXbSNCyaBMECUvaVeAY4YrTJycUcHMXiMyfw53DcspefJJtiTpEee7aiLPT4FlaKWQiems
R1gd0707OSXopws8v63cZ/iX/RdaWYqnVzh2oA/QmpePzs1FVFpcmgK0GYuwyCMWieB/pWkAUItR
mga5rJUtB/xv61gGaCX70HmfODB4XLdhKfWret2hSjck290W2Mnmf5uaNoJ/1rWa0Oupf26GgktE
QN04MSHHIQaAHHQP4sJhjXuRjX4VFFEPT6e9QUbq0o0GAAAAAAAA

--Apple-Mail=_1BFB4BB4-C4C1-4076-8668-5B3F4100EC02--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
