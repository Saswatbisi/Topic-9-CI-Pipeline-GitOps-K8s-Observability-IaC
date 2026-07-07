import { CapstoneAuditor } from '../src/capstoneAuditor';
import * as fs from 'fs';
import * as path from 'path';

describe('Actual DevOps Configurations Compliance Verification', () => {
  let auditor: CapstoneAuditor;

  beforeEach(() => {
    auditor = new CapstoneAuditor();
  });

  test('kubernetes/base/deployment.yaml must be valid', () => {
    const filePath = path.join(__dirname, '../kubernetes/base/deployment.yaml');
    const content = fs.readFileSync(filePath, 'utf8');
    const report = auditor.auditKubernetesManifest(content);

    expect(report.valid).toBe(true);
    expect(report.violations).toHaveLength(0);
  });

  test('kubernetes/application.yaml must be valid', () => {
    const filePath = path.join(__dirname, '../kubernetes/application.yaml');
    const content = fs.readFileSync(filePath, 'utf8');
    const report = auditor.auditArgoCDApplication(content);

    expect(report.valid).toBe(true);
    expect(report.violations).toHaveLength(0);
  });

  test('.github/workflows/ci.yml must be valid', () => {
    const filePath = path.join(__dirname, '../.github/workflows/ci.yml');
    const content = fs.readFileSync(filePath, 'utf8');
    const report = auditor.auditCIPipelineSecurity(content);

    expect(report.valid).toBe(true);
    expect(report.violations).toHaveLength(0);
  });
});
